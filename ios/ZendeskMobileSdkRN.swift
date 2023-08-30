import ZendeskCoreSDK
import SupportProvidersSDK
import UIKit
import SupportSDK
import CommonUISDK

@objc(ZendeskMobileSdkRN)
class ZendeskMobileSdkRN: NSObject {

  @objc(initZendesk:withAppId:withClientId:)
  func initZendesk(url: String, appId: String, clientId: String)-> Void {
    Zendesk.initialize(appId: appId, clientId: clientId, zendeskUrl: url)
    Support.initialize(withZendesk: Zendesk.instance)
    let ident = Identity.createAnonymous()
    Zendesk.instance?.setIdentity(ident)
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
    uiNavStyle.barTintColor = pColor

    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search...", attributes: [.foregroundColor: phColor])

  }

  @objc
  func showHelpCenter() -> Void {
    DispatchQueue.main.async {
      let helpCenter = HelpCenterUi.buildHelpCenterOverviewUi(withConfigs: [])

      helpCenter.navigationItem.titleView?.backgroundColor = .red
      if let rightBarButtonItem = helpCenter.navigationItem.rightBarButtonItem {
        rightBarButtonItem.tintColor = .red
      }
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
  
}
