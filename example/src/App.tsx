import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import {
  initZendesk,
  showHelpCenter,
  setColors,
  showMyTickets,
} from 'zendesk-mobile-sdk-rn';
import ZendeskConfig from './ZendeskConfig';

export default function App() {
  React.useEffect(() => {
    initZendesk({
      zendeskUrl: ZendeskConfig.zendeskUrl,
      appId: ZendeskConfig.appId,
      clientId: ZendeskConfig.clientId,
    });
    setColors({
      primaryColor: '#00ff00',
      titleColor: '#ff0000',
      placeholderColor: '#0000ff',
    });
  }, []);

  const handleHelpCenterClick = React.useCallback(() => {
    showHelpCenter();
  }, []);

  const handleMyTicketClick = React.useCallback(() => {
    showMyTickets();
  }, []);

  return (
    <View style={styles.container}>
      <Button title="Help Center" onPress={handleHelpCenterClick} />
      <Button title="My Tickets" onPress={handleMyTicketClick} />
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
