# zendesk-mobile-sdk-rn

zendesk mobile sdk for react native

## Installation

```sh
npm install zendesk-mobile-sdk-rn
```

and add this to **build.gradle** file (not app build.gradle)

```groovy
allprojects {
    repositories {
    maven { url 'https://zendesk.jfrog.io/zendesk/repo' }
  }
}
```

## Usage

```js
import { initZendesk, showHelpCenter, setColors /* just for ios*/ } from 'zendesk-mobile-sdk-rn';

// ...
React.useEffect(() => {
  initZendesk({
    zendeskUrl: ZendeskConfig.zendeskUrl,
    appId: ZendeskConfig.appId,
    clientId: ZendeskConfig.clientId,
  });

  // just for ios
  setColors({
    primaryColor: '#00ff00',
    titleColor: '#ff0000',
    placeholderColor: '#0000ff',
  });
}, []);

const handleBtnClick = React.useCallback(() => {
  showHelpCenter();
}, []);

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
