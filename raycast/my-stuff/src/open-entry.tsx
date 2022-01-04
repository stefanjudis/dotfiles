import { List, ActionPanel, OpenInBrowserAction, getPreferenceValues, popToRoot } from "@raycast/api";
import {useState, useEffect} from 'react'
import {createClient} from 'contentful-management'

interface Preferences {
  token: string;
  spaceId: string;
}

const defaultLocale = "en-US";

export default function Command() {
  const [query, setQuery] = useState('');
  const [entries, setEntries] = useState([]);

  useEffect(() => {
    const preferences: Preferences = getPreferenceValues();
    const client = createClient({
      accessToken: preferences.token,
    }, {type: "plain" });

    client.entry.getMany({
      spaceId: preferences.spaceId,
      environmentId: 'master',
      query: {
        query
      }
    }).then(response => setEntries(response.items))

  }, [query])

  return (
    <>
      <List id="list" navigationTitle="Contentful entries" throttle={true} onSearchTextChange={setQuery}>
        {
          entries.map((entry) => (
            <List.Item
              key={entry.sys.id}
              title={entry.fields.title ? entry.fields.title[defaultLocale] : 'No title...'}
              actions={
                <ActionPanel>
                  <OpenInBrowserAction
                    url={`https://app.contentful.com/spaces/f20lfrunubsq/entries/${entry.sys.id}`}
                    onOpen={() => popToRoot({clearSearchBar: true})}
                  />
                </ActionPanel>
              }
            />
          ))
        }
      </List>
    </>

  );
}
