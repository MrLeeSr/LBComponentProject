//
//  LFBaseTabBarController.swift
//  huiyangche
//
//  Created by 你的名字 on 2018/6/26.
//  Copyright © 2018年 com.njyl. All rights reserved.
//

import UIKit

class LFBaseTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    let LBUserDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = LXSize.baseColor()
        tabbar.barTintColor = UIColor.white
        /// 添加子控制器
        addChildViewControllers()
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    /// 设置控制器
    private func setChildController(controller: UIViewController,title: String, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.selectedImage = UIImage(named: imageName.replacingOccurrences(of: "unse", with: ""))
    }
    /// 添加子控制器
    private func addChildViewControllers() {

        setChildViewController(LBHomeViewController(), title: "首页", imageName: "首页")
        setChildViewController(LBCommunityViewController(), title: "社区", imageName: "社区")
        setChildViewController(LBPeerViewController(), title: "文明同行", imageName: "文明同行")
        setChildViewController(LBMineViewController(), title: "我的", imageName: "我的")
        
    }
    /// 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        setChildController(controller: childController,title: title, imageName: imageName)
        childController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        addChildViewController(LFBaseNavigationController(rootViewController: childController))
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
