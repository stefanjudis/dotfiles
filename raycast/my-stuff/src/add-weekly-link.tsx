import { Form, ActionPanel, SubmitFormAction, showToast, ToastStyle, getPreferenceValues, popToRoot, showHUD } from "@raycast/api";
import {useState} from 'react'
import {createClient} from 'contentful-management'

interface CommandForm {
  headline: string;
  url: string;
}

interface Preferences {
  token: string;
  spaceId: string;
}

const defaultLocale = "en-US";

export default function Command() {
  const [isLoading, setIsLoading] = useState(false)

  async function handleSubmit(values: CommandForm) {
    try {
      setIsLoading(true);
      const preferences: Preferences = getPreferenceValues();
      const client = createClient({
        accessToken: preferences.token,
      });

      const space = await client.getSpace(preferences.spaceId);
      const environment = await space.getEnvironment("master");
      const weeklies = await environment.getEntries({
        content_type: "2wKn6yEnZewu2SCCkus4as",
        "fields.title[match]": "Web Weekly #",
        "sys.publishedCounter": "0",
        order: "sys.createdAt",
      });

      const nextWeekly = weeklies.items[0];

      nextWeekly.fields.body[defaultLocale] =
      nextWeekly.fields.body[defaultLocale] + `\n\n## ${values.headline}\n\n${values.url}`;

      await nextWeekly.update();
      await showHUD("Added weekly link");
      await popToRoot({clearSearchBar: true});
    } catch (error) {
      showToast(ToastStyle.Failure, "Add Weekly Link", "Shiat...");
    } finally {
      setIsLoading(false);
    }
  }

  return (
    <Form
      actions={
        <ActionPanel>
          <SubmitFormAction onSubmit={handleSubmit} />
        </ActionPanel>
      }
      isLoading={isLoading}
    >
      <Form.TextField id="headline" title="Headline" placeholder="Enter headline" defaultValue="Something fancy"/>
      <Form.TextField id="url" title="Url" placeholder="Enter Url" defaultValue="https://example.com"/>
    </Form>
  );
}
