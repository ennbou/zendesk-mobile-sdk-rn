import ZendeskCoreSDK
import SupportProvidersSDK
import UIKit
import SupportSDK
import CommonUISDK

@objc(ZendeskMobileSdkRN)
class ZendeskMobileSdkRN: NSObject {

  @objc(initZendeskAnonymous:withAppId:withClientId:)
  func initZendeskAnonymous(url: String, appId: String, clientId: String)-> Void {
    Zendesk.initialize(appId: appId, clientId: clientId, zendeskUrl: url)
    Support.initialize(withZendesk: Zendesk.instance)
    let ident = Identity.createAnonymous()
    Zendesk.instance?.setIdentity(ident)
  }

  @objc(initZendeskJwt:withAppId:withClientId:withJwt:)
  func initZendeskJwt(url: String, appId: String, clientId: String, jwt: String)-> Void {
    Zendesk.initialize(appId: appId, clientId: clientId, zendeskUrl: url)
    Support.initialize(withZendesk: Zendesk.instance)
    let identity = Identity.createJwt(token: jwt)
    Zendesk.instance?.setIdentity(identity)
  }

  @objc(setColors:withTitleColor:withPlaceholderColor:)
  func setColors(primaryColor: String, titleColor:String, placeholderColor:String) -> Void {

    let pColor = UIColor(hex:primaryColor)
    let tColor = UIColor(hex: titleColor)
    let phColor = UIColor(hex: placeholderColor)
    
    CommonTheme.currentTheme.primaryColor =  pColor
    
    let uiNavStyle = UINavigationBar.appearance()
    
    uiNavStyle.titleTextAttributes =  [.foregroundColor:tColor]
    
    uiNavStyle.tintColor = tColor
    uiNavStyle.backgroundColor = pColor
    uiNavStyle.barTintColor = pColor

    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search...", attributes: [.foregroundColor: phColor])

  }

  @objc(showHelpCenter:)
  func showHelpCenter(isAuth: Bool) -> Void {
    DispatchQueue.main.async {
      let helpCenterConfig = HelpCenterUiConfiguration()
      let articleConfig = ArticleUiConfiguration()
      helpCenterConfig.showContactOptions = isAuth
      articleConfig.showContactOptions = isAuth

      let helpCenter = HelpCenterUi.buildHelpCenterOverviewUi(withConfigs: [helpCenterConfig, articleConfig])

      let navigationController = UINavigationController(rootViewController: helpCenter)
      
      let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      
      if var topController = keyWindow?.rootViewController {
          while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
          }
        topController.present(navigationController, animated: true)
      }
    }
  }

  @objc
  func showMyTickets() -> Void {
    DispatchQueue.main.async {
      let requestListController = RequestUi.buildRequestList()

      let navigationController = UINavigationController(rootViewController: requestListController)
      
      let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      
      if var topController = keyWindow?.rootViewController {
          while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
          }
        topController.present(navigationController, animated: true)
      }
    }
  }
  
}
