import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { initZendesk, showHelpCenter } from 'zendesk-mobile-sdk-rn';
import ZendeskConfig from './ZendeskConfig';

export default function App() {
  React.useEffect(() => {
    initZendesk({
      zendeskUrl: ZendeskConfig.zendeskUrl,
      appId: ZendeskConfig.appId,
      clientId: ZendeskConfig.clientId,
    });
  }, []);

  const handleBtnClick = React.useCallback(() => {
    showHelpCenter();
  }, []);

  return (
    <View style={styles.container}>
      <Button title="Help Center" onPress={handleBtnClick} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
