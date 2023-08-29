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

export function multiply(a: number, b: number): Promise<number> {
  return ZendeskMobileSdkRN.multiply(a, b);
}
