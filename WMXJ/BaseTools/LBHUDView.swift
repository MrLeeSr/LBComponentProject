//
//  LBHUDView.swift
//  lindaiOS
//
//  Created by 李斌 on 16/10/10.
//  Copyright © 2016年 com.njyl.lindaiOS. All rights reserved.
//

import UIKit

class LBHUDView: NSObject {

    var hud = JGProgressHUD(style: JGProgressHUDStyle.dark)
    
    
    
    init(inView : UIView , HUDType : String , text : String , animation : Bool, Color:Bool) {
        
        self.hud.hudView.layer.shadowColor = UIColor.black.cgColor
        if Color{
            hud = JGProgressHUD(style: JGProgressHUDStyle.extraLight)
            self.hud.hudView.layer.shadowColor = UIColor.white.cgColor
            
        }
        
        self.hud.hudView.layer.shadowOffset = CGSize.zero
        self.hud.hudView.layer.shadowOpacity = 0.4
        self.hud.hudView.layer.shadowRadius = 8.0
        
        if HUDType == "SUCCESS" {
            self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        }else if HUDType == "FAIL"{
            self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
        }else if HUDType == "Text"{
            
            self.hud.indicatorView = nil

        }
        
        for childView in inView.subviews {
            if childView is JGProgressHUD {
                childView.removeFromSuperview()
            }
        }
        
        self.hud.square = false
        self.hud.textLabel.text = text
        self.hud.animation = JGProgressHUDFadeZoomAnimation()
        self.hud.interactionType = JGProgressHUDInteractionType.blockNoTouches
        
        self.hud.show(in: inView, animated: animation)
        
        if HUDType == ""{
        }else{
            self.hud.dismiss(afterDelay: 1.5, animated: true)
        }
        
        
    }
    
    
    func hideHUD() {
        self.hud.dismiss()
    }
    
}
