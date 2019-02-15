//
//  LFBaseNavigationController.swift
//  huiyangche
//
//  Created by 你的名字 on 2018/6/26.
//  Copyright © 2018年 com.njyl. All rights reserved.
//

import UIKit

class LFBaseNavigationController: UINavigationController, UINavigationControllerDelegate{
        var popDelegate:UIGestureRecognizerDelegate?
        
        override init(rootViewController: UIViewController) {
            super.init(rootViewController: rootViewController)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        }
    
    override var shouldAutorotate: Bool{
        return false
    }
        
//        let lineView = UIView()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            //navigationBar的背景,字体，字体颜色设置
//            lineView.frame = CGRect(x: 0, y: StatusBar_Height + 43.5, width: LXSize.ScreenSize_Width(), height: 0.5)
//            lineView.backgroundColor = LXSize.bgViewColor()
//            self.navigationController?.navigationBar.addSubview(lineView)
            self.navigationBar.barTintColor = LXSize.baseColor()
            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:LXSize.baseColor()]
            self.navigationBar.isTranslucent = false
            //返回手势
            self.popDelegate = self.interactivePopGestureRecognizer?.delegate
            self.delegate = self
            self.navigationBar.setBackgroundImage(self.imageFromColor(color: UIColor.white), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
            self.navigationBar.shadowImage = UIImage()
        }
        
        // UIGestureRecognizerDelegate代理
        func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
            //实现滑动返回的功能
            //清空滑动返回手势的代理就可以实现
            if viewController == self.viewControllers[0]{
                self.interactivePopGestureRecognizer?.delegate = self.popDelegate
            }else{
                self.interactivePopGestureRecognizer?.delegate = nil
            }
        }
        
        // 拦截跳转事件
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            if self.childViewControllers.count > 0{
                viewController.hidesBottomBarWhenPushed = true
                let item = UIBarButtonItem(image: UIImage(named: "LBBackRed"), style: .plain, target: self, action: #selector(navigationBack))
                item.tintColor = LXSize.baseColor()
                viewController.navigationItem.leftBarButtonItem = item
                
            }
            super.pushViewController(viewController, animated: true)
        }
        /// 返回上一控制器
        @objc private func navigationBack() {
            popViewController(animated: true)
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    func imageFromColor(color: UIColor) -> UIImage {
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

        
}
