//
//  LBMineViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/4.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBMineViewController: LBBaseViewController {

    let headView = UIView()
    
    let headIcon = UIImageView()
    
    let userNameLabel = UILabel()
    
    let tabview = UITableView(frame: .zero, style: .grouped)
    
    let dataAry = [ [["img":"个人信息","name":"个人信息"],["img":"服务记录","name":"服务记录"],["img":"我的收藏","name":"我的收藏"]],[["img":"客服中心","name":"客服中心"],["img":"系统设置","name":"系统设置"] ] ]
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        let vi = UIView()
        self.view.addSubview(vi)
        
        self.headView.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: (210 * ScreenSize_Width)/375 + 50)
        let img = UIImageView.init(frame: CGRect(x: 0, y: 0, width: ScreenSize_Width, height: (210 * ScreenSize_Width)/375))
        img.image = UIImage.init(named: "lbMineHeadbg")
        self.headView.addSubview(img)
        
        headIcon.frame = CGRect(x: (ScreenSize_Width - 72)/2.0, y: 100, width: 72, height: 72)
        headIcon.image = UIImage.init(named: "t3")
        
        let headBG = UIView.init(frame: CGRect(x: 10, y: 136, width: ScreenSize_Width - 20, height: headView.height - 144))
        headBG.backgroundColor = UIColor.white
        headBG.layer.cornerRadius = 5
        headBG.layer.shadowColor = UIColor.gray.cgColor
        headBG.layer.shadowOpacity = 1
        //zero表示不偏移
        headBG.layer.shadowRadius = 5
        headBG.layer.shadowOffset = CGSize.init(width: 3, height: 3)
        headView.addSubview(headBG)
        headView.addSubview(headIcon)
        
        userNameLabel.frame = CGRect(x: 20, y: headIcon.bottom + 10, width: ScreenSize_Width - 40, height: 20)
        userNameLabel.font = UIFont.init(name: "PingFangHK-Regular", size: 15)
        userNameLabel.textColor = LXSize.fontColor()
        userNameLabel.text = "萝卜青菜"
        userNameLabel.textAlignment = .center
        headView.addSubview(userNameLabel)
        
        let line = UIView.init(frame: CGRect(x: 0, y: headBG.height - 41.5, width: headBG.width, height: 0.8))
        line.backgroundColor = UIColor.lightGray
        line.alpha = 0.25
        headBG.addSubview(line)
        
        let signBtn = self.crectBtn(leftImg: "签到", rightText: "签到 1天", btnFrame: CGRect(x: 0, y: line.bottom, width: headBG.width/2.0, height: 42))
        headBG.addSubview(signBtn)
        
        let integralBtn = self.crectBtn(leftImg: "积分", rightText: "积分 1260", btnFrame: CGRect(x: headBG.width/2.0, y: line.bottom, width: headBG.width/2.0, height: 42))
        headBG.addSubview(integralBtn)
        
        var tabheigh:CGFloat = 0
        if self.tabBarController != nil{
            tabheigh = self.tabBarController!.tabBar.height
        }
        self.tabview.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - tabheigh)
        tabview.dataSource = self
        tabview.delegate = self
        tabview.register(UITableViewCell.self, forCellReuseIdentifier: "lbmineCell")
        self.view.addSubview(tabview)
        self.tabview.tableHeaderView = self.headView
        
        if #available(iOS 11.0, *) {
            self.tabview.estimatedSectionHeaderHeight = 0;
            self.tabview.estimatedSectionFooterHeight = 0;
            self.tabview.contentInsetAdjustmentBehavior = .never;
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

}

extension LBMineViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ary = self.dataAry[section] as NSArray
        return ary.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabview.dequeueReusableCell(withIdentifier: "lbmineCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        for vi in cell.contentView.subviews{
            vi.removeFromSuperview()
        }
        let ary = self.dataAry[indexPath.section] as NSArray
        let dic = ary[indexPath.row] as! NSDictionary
        let img = UIImageView.init(frame: CGRect(x: 25, y: 11.5, width: 23, height: 22))
        img.image = UIImage.init(named: dic["img"] as! String)
        cell.contentView.addSubview(img)
        
        let lab = UILabel.init(frame: CGRect(x: img.right + 15, y: 0, width: 200, height: 45))
        lab.textColor = UIColor.gray
        lab.font = UIFont.init(name: "PingFangSC-Regular", size: 14)
        lab.text = dic["name"] as? String
        cell.contentView.addSubview(lab)
        return cell
    }
    
    func crectBtn(leftImg:String,rightText:String,btnFrame:CGRect) -> UIButton{
        let btn = UIButton.init(type: .custom)
        btn.frame = btnFrame
        
        let img = UIImageView.init(frame: CGRect(x: 30, y: 10, width: 22, height: 22))
        img.image = UIImage.init(named: leftImg)
        btn.addSubview(img)
        
        let lab = UILabel.init(frame: CGRect(x: img.right + 10, y: 0, width: btn.width - img.right - 15, height: btn.height))
        lab.font = UIFont.init(name: "OriyaSangamMN", size: 13)
        lab.textColor = UIColor.gray
        lab.text = rightText
        btn.addSubview(lab)
        return btn
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tabview.deselectRow(at: indexPath, animated: true)
    }
}
