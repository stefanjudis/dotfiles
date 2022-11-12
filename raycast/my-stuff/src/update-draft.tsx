import {
  List,
  ActionPanel,
  Form,
  SubmitFormAction,
  getPreferenceValues,
  popToRoot,
  showHUD,
  useNavigation,
} from "@raycast/api";
import { useState, useEffect } from "react";
import { createClient } from "contentful-management";
import { defaultMaxListeners } from "events";

interface Preferences {
  token: string;
  spaceId: string;
}

interface CommandForm {
  headline: string;
  body: string;
}

const defaultLocale = "en-US";

function DraftList() {
  const [entries, setEntries] = useState([]);
  const [entryId, setEntryId] = useState<string | undefined>(undefined);
  const { push } = useNavigation();

  useEffect(() => {
    const preferences: Preferences = getPreferenceValues();
    const client = createClient(
      {
        accessToken: preferences.token,
      },
      { type: "plain" }
    );

    client.entry
      .getMany({
        spaceId: preferences.spaceId,
        environmentId: "master",
        query: {
          "sys.archivedAt[exists]": false,
          "sys.publishedAt[exists]": false,
          order: "-sys.updatedAt",
        },
      })
      .then((response) => setEntries(response.items));
  }, []);

  return (
    <>
      <List
        id="list"
        navigationTitle="Blog drafts"
        onSelectionChange={(entryId) => {
          setEntryId(entryId);
        }}
      >
        {entries.map((entry) => (
          <List.Item
            key={entry.sys.id}
            title={`${entry.sys.updatedAt.substr(0, 10)}: ${
              entry.fields.title ? entry.fields.title[defaultLocale] : "No title..."
            }`}
            id={entry.sys.id}
            actions={
              <ActionPanel>
                <ActionPanel.Item title="Open Draft" onAction={() => push(<DraftEditor entryId={entryId} />)} />
              </ActionPanel>
            }
          />
        ))}
      </List>
    </>
  );
}

function DraftEditor({ entryId }) {
  const [entry, setEntry] = useState<{ title: string; body: string } | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const preferences: Preferences = getPreferenceValues();
  const client = createClient(
    {
      accessToken: preferences.token,
    },
    { type: "plain" }
  );

  useEffect(() => {
    client.entry
      .get({
        spaceId: preferences.spaceId,
        environmentId: "master",
        entryId,
      })
      .then((entry) => {
        setIsLoading(false);
        setEntry({
          title: entry.fields.title[defaultLocale],
          body: entry.fields.body[defaultLocale],
        });
      });
  }, []);

  async function updateEntry(values: CommandForm) {
    setIsLoading(true);
    const ctfEntry = await client.entry.get({
      spaceId: preferences.spaceId,
      environmentId: "master",
      entryId,
    });

    ctfEntry.fields.body[defaultLocale] = values.body;

    const newEntry = await client.entry.update(
      {
        spaceId: preferences.spaceId,
        environmentId: "master",
        entryId,
      },
      { sys: ctfEntry.sys, fields: ctfEntry.fields }
    );
    await showHUD(`Updated "${newEntry.fields.title[defaultLocale]}"`);
    await popToRoot({ clearSearchBar: true });
  }

  return (
    <Form
      actions={
        <ActionPanel>
          <SubmitFormAction onSubmit={updateEntry} />
        </ActionPanel>
      }
      isLoading={isLoading}
    >
      {entry ? (
        <>
          <Form.TextField id="headline" title="Headline" defaultValue={entry.title} />
          <Form.TextArea id="body" title="Body" defaultValue={entry.body} />
        </>
      ) : (
        ""
      )}
    </Form>
  );
}

export default function Command() {
  return <DraftList></DraftList>;
}
