#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ZendeskMobileSdkRN, NSObject)

RCT_EXTERN_METHOD(initZendeskAnonymous:(NSString)url withAppId:(NSString)appId withClientId:(NSString)clientId)

RCT_EXTERN_METHOD(initZendeskJwt:(NSString)url withAppId:(NSString)appId withClientId:(NSString)clientId withJwt:(NSString)jwt)

RCT_EXTERN_METHOD(showHelpCenter:(BOOL)isAuth)

RCT_EXTERN_METHOD(showMyTickets)

RCT_EXTERN_METHOD(setColors:(NSString)primaryColor withTitleColor:(NSString)titleColor withPlaceholderColor:(NSString)placeholderColor)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
