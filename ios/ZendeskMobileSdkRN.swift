@objc(ZendeskMobileSdkRN)
class ZendeskMobileSdkRN: NSObject {

  @objc(withUrl:withAppId:withClientId:)
  func initZendesk(url: String, appId: String, clientId: String)-> Void {
    Zendesk.initialize(appId: appId, clientId: clientId, zendeskUrl: zendeskUrl)
    Support.initialize(withZendesk: Zendesk.instance)
    let ident = Identity.createAnonymous()
    Zendesk.instance?.setIdentity(ident)
    
    let greenColor = UIColor(red: 11/255, green: 77/255, blue: 84/255, alpha: 1)
    
    CommonTheme.currentTheme.primaryColor =  greenColor
    
    let uiNavStyle = UINavigationBar.appearance()
    
    uiNavStyle.titleTextAttributes =  [.foregroundColor:UIColor.white]
    
    uiNavStyle.tintColor = .white
    uiNavStyle.barTintColor = greenColor
    
   
    navigationItem.searchController?.searchBar.searchTextField.leftView?.tintColor = .white
    
    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search...", attributes: [.foregroundColor: UIColor.lightGray])
  }

  @objc
  func presentHelpCenter() -> Void {
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
