import UIKit

extension UIColor {

  convenience init(hex: String){
    var colorHexFormat = hex
    if(colorHexFormat.hasPrefix("#")) {
      colorHexFormat.remove(at: colorHexFormat.startIndex)
    }

    if (colorHexFormat.count != 6){
      self.init(red: 0, green: 0, blue: 0, alpha: 1)
    }else{
      var rgbValue:UInt64 = 0
      Scanner(string: colorHexFormat).scanHexInt64(&rgbValue)
      self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255,green: CGFloat((rgbValue & 0x00FF00) >> 8)/255,blue: CGFloat(rgbValue & 0x0000FF)/255,alpha: 1)
    }
  }
  
}