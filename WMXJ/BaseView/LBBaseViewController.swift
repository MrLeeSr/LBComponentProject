//
//  LBBaseViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/4.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = LXSize.bgViewColor()
        
        // Do any additional setup after loading the view.
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
