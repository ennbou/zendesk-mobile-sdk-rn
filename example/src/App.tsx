import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import {
  initZendeskAnonymous,
  showHelpCenter,
  setColors,
  initZendeskJwt,
} from 'zendesk-mobile-sdk-rn';
import ZendeskConfig from './ZendeskConfig';

export default function App() {
  React.useEffect(() => {
    setColors({
      primaryColor: '#00ff00',
      titleColor: '#ff0000',
      placeholderColor: '#0000ff',
    });
  }, []);

  const handleHelpCenterClick = React.useCallback(() => {
    showHelpCenter(false);
  }, []);

  const initJwt = React.useCallback(() => {
    initZendeskJwt({
      zendeskUrl: ZendeskConfig.jwt.zendeskUrl,
      appId: ZendeskConfig.jwt.appId,
      clientId: ZendeskConfig.jwt.clientId,
      jwt: 'jwt',
    });
  }, []);

  const iniAnonymous = React.useCallback(() => {
    initZendeskAnonymous({
      zendeskUrl: ZendeskConfig.anonymous.zendeskUrl,
      appId: ZendeskConfig.anonymous.appId,
      clientId: ZendeskConfig.anonymous.clientId,
    });
  }, []);

  return (
    <View style={styles.container}>
      <Button title="Help Center" onPress={handleHelpCenterClick} />
      <Button title="Init Jwt" onPress={initJwt} />
      <Button title="Init Anonymous" onPress={iniAnonymous} />
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
