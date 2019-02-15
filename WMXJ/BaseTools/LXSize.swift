//
//  Size.swift
//  04
//
//  Created by 李斌 on 2016/10/27.
//  Copyright © 2016年 com.njyl. All rights reserved.
//

import UIKit

public let NavigationH: CGFloat = 44 + UIApplication.shared.statusBarFrame.size.height
public let TabBarH: CGFloat = 49

public let ScreenSize_Width: CGFloat = UIScreen.main.bounds.width

public let ScreenSize_Height: CGFloat = UIScreen.main.bounds.height

public let SCREEN_RATE: CGFloat = (UIDevice.current.userInterfaceIdiom == .phone) ? UIScreen.main.bounds.width / 375.0 : UIScreen.main.bounds.width / 768.0

public let StatusBar_Height:CGFloat = UIApplication.shared.statusBarFrame.size.height

class LXSize: NSObject {
    class func LBStatusBar_Height() -> CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    class func ScreenSize_Height() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    class func ScreenSize_Width() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    class func SCREEN_RATE() -> CGFloat {
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            return UIScreen.main.bounds.width / 375.0
        }
        return UIScreen.main.bounds.width / 768.0
    }
    
    //app主题色
    class func baseColor ()->UIColor{
        let Color_Value : NSString = "#ff6600"
        let alpha : CGFloat = 1.0
        var  Str :NSString = Color_Value.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
        
        if Color_Value.hasPrefix("#"){
            Str=(Color_Value as NSString).substring(from: 1) as NSString
        }
        let redStr = (Str as NSString ).substring(to: 2)
        let greenStr = ((Str as NSString).substring(from: 2) as NSString).substring(to: 2)
        let blueStr = ((Str as NSString).substring(from: 4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string:redStr).scanHexInt32(&r)
        Scanner(string: greenStr).scanHexInt32(&g)
        Scanner(string: blueStr).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    //app内字体颜色 #4F4F4F
    class func fontColor ()->UIColor{
        return UIColor.init(red: 79 / 255.0, green: 79 / 255.0, blue: 79 / 255.0, alpha: 1.0)
    }
    //页面背景颜色 #E9E9E9
    class func bgViewColor ()->UIColor{
        return UIColor.init(red: 238 / 255.0, green: 238 / 255.0, blue: 238 / 255.0, alpha: 1.0)
    }
    
    //正则表达式判断手机号是否合法
   class func isTelNumber(num:NSString)->Bool
    {
        
        let mobile = "^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|147)\\d{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: num) == true {
            return true
        }else
        {
            return false
        }
    }
    //正则表达式判断邮箱
    class func isEmail(email:String) -> Bool {
        let predicateStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let currObject = email
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: currObject)
    }
    
    class func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        
        return false
    }
}

struct common {
    // ViewController的背景颜色
    static let ButtonBacegroundColor: UIColor = UIColor.init(red: 187/255.0, green: 32/255.0, blue: 45/255.0, alpha: 1)
    
}

extension UIView{
    class func lineView(frame:CGRect) -> UIView {
        let listBarBg = UIView(frame: frame)
        listBarBg.backgroundColor = UIColor.white
        
        let line = UIView(frame:CGRect(x: 0, y: 0, width: frame.size.width, height: 0.8))
        line.backgroundColor = UIColor.lightGray
        line.alpha = 0.22
        listBarBg.addSubview(line)
        
        let line1 = UIView(frame:CGRect(x: 0, y: frame.size.height - 0.7, width: frame.size.width, height: 0.8))
        line1.backgroundColor = UIColor.lightGray
        line1.alpha = 0.22
        listBarBg.addSubview(line1)
        
        return listBarBg
    }
}
