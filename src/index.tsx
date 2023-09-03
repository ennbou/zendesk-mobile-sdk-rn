import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'zendesk-mobile-sdk-rn' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const ZendeskMobileSdkRN = NativeModules.ZendeskMobileSdkRN
  ? NativeModules.ZendeskMobileSdkRN
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function initZendeskJwt(zendeskConfig: {
  zendeskUrl: String;
  appId: String;
  clientId: String;
  jwt: String;
}) {
  ZendeskMobileSdkRN.initZendeskJwt(
    zendeskConfig.zendeskUrl,
    zendeskConfig.appId,
    zendeskConfig.clientId,
    zendeskConfig.jwt
  );
}

export function initZendeskAnonymous(zendeskConfig: {
  zendeskUrl: String;
  appId: String;
  clientId: String;
}) {
  ZendeskMobileSdkRN.initZendeskAnonymous(
    zendeskConfig.zendeskUrl,
    zendeskConfig.appId,
    zendeskConfig.clientId
  );
}

export function showHelpCenter(isAuth: boolean) {
  ZendeskMobileSdkRN.showHelpCenter(isAuth);
}

export function setColors(colors: {
  primaryColor: String;
  titleColor: String;
  placeholderColor: String;
}) {
  if (Platform.OS === 'ios') {
    ZendeskMobileSdkRN.setColors(
      colors.primaryColor,
      colors.titleColor,
      colors.placeholderColor
    );
  }
}

export function showMyTickets() {
  ZendeskMobileSdkRN.showMyTickets();
}
