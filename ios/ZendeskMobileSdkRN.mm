#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ZendeskMobileSdkRN, NSObject)

RCT_EXTERN_METHOD(initZendesk: withUrl:(NSString)url withAppId:(NSString)appId withClientId:(NSString)clientId)
RCT_EXTERN_METHOD(presentHelpCenter)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
