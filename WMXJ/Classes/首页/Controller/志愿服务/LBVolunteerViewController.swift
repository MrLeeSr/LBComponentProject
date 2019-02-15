//
//  LBWmdjtViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/7.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBVolunteerViewController: LBBaseViewController {
    
    let tabview = UITableView(frame: .zero, style: .grouped)
    
    var dataAry = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let ary = [["needCount":30,"hadCount":28,"img":"firstPageDetailp9","name":"志愿活动名称","time":"2018.12.17","content":"3月18日下午，ｘｘ老人之家内，ｘｘ职高的同学们有的为那里的老人们打扫庭院，有的和他们肩并肩、手拉手地聊家常。光荣院里的老人有很多虽然已经年过八九十岁，但在交流中却依然精神矍铄，他们时而侃侃言谈，时而微笑致意……ｘｘ职高的同学们还个性准备了一些礼物和节目送给他们，老人们为此个性感激。"],["needCount":30,"hadCount":26,"img":"firstPageDetailp9","name":"志愿活动名称","time":"2018.12.15","content":"3月18日下午，ｘｘ老人之家内，ｘｘ职高的同学们有的为那里的老人们打扫庭院，有的和他们肩并肩、手拉手地聊家常。光荣院里的老人有很多虽然已经年过八九十岁，但在交流中却依然精神矍铄，他们时而侃侃言谈，时而微笑致意……ｘｘ职高的同学们还个性准备了一些礼物和节目送给他们，老人们为此个性感激。"],["needCount":30,"hadCount":25,"img":"firstPageDetailp9","name":"志愿活动名称","time":"2018.12.14","content":"3月18日下午，ｘｘ老人之家内，ｘｘ职高的同学们有的为那里的老人们打扫庭院，有的和他们肩并肩、手拉手地聊家常。光荣院里的老人有很多虽然已经年过八九十岁，但在交流中却依然精神矍铄，他们时而侃侃言谈，时而微笑致意……ｘｘ职高的同学们还个性准备了一些礼物和节目送给他们，老人们为此个性感激。"],["needCount":30,"hadCount":24,"img":"firstPageDetailp9","name":"志愿活动名称","time":"2018.12.13","content":"3月18日下午，ｘｘ老人之家内，ｘｘ职高的同学们有的为那里的老人们打扫庭院，有的和他们肩并肩、手拉手地聊家常。光荣院里的老人有很多虽然已经年过八九十岁，但在交流中却依然精神矍铄，他们时而侃侃言谈，时而微笑致意……ｘｘ职高的同学们还个性准备了一些礼物和节目送给他们，老人们为此个性感激。"]]
        self.dataAry = NSArray(array: ary)
        self.tabview.reloadData()
    }
    
    func setUpUI(){
        self.title = "志愿服务"
        
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 23, height: 23)
        btn.setImage(UIImage.init(named: "申请注册"), for: .normal)
        btn.addTarget(self, action: #selector(rightConfirmBtnAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
        
        self.tabview.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - 44 - StatusBar_Height)
        tabview.dataSource = self
        tabview.delegate = self
        tabview.register(UINib.init(nibName: "LBVolunteerTableViewCell", bundle: nil), forCellReuseIdentifier: "LBVolunteerTableViewCell")
        self.view.addSubview(tabview)
        
        if #available(iOS 11.0, *) {
            self.tabview.estimatedSectionHeaderHeight = 0;
            self.tabview.estimatedSectionFooterHeight = 0;
            self.tabview.contentInsetAdjustmentBehavior = .never;
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    @objc func rightConfirmBtnAction(){
        let webview = TOWebViewController.init(urlString: "http://wmsjy-prod.cn-north-1.eb.amazonaws.com.cn/html/wenming.html")
        webview.navigationButtonsHidden = true
        webview.doneButtonTitle = "取消"
        webview.showUrlWhileLoading = false
        webview.loadingBarTintColor = LXSize.baseColor()
        webview.webTitle = "志愿者注册"
        webview.buttonTintColor = LXSize.baseColor()
        self.navigationController?.pushViewController(webview, animated: true)
    }
    
    @objc func lbBackBtnAction(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @objc func confirAction(btn:UIButton){
        _ = LBHUDView.init(inView: self.view, HUDType: "Text", text: "暂未登录", animation: true, Color: false)
    }
    
}
extension LBVolunteerViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabview.dequeueReusableCell(withIdentifier: "LBVolunteerTableViewCell", for: indexPath) as! LBVolunteerTableViewCell
        cell.selectionStyle = .none
        let dic = self.dataAry[indexPath.row] as! NSDictionary
        var img = ""
        if let imgStr = dic["img"] as? String{
            img = imgStr
        }
        cell.leftIcon.image = UIImage.init(named: img)
        cell.leftIcon.layer.masksToBounds = true
        cell.leftIcon.layer.cornerRadius = 3
        cell.leftIcon.contentMode = .scaleAspectFill
        cell.ConfirmBtn.layer.cornerRadius = 15
        cell.nameLabe.text = dic["name"] as? String
        cell.contentLab.text = dic["content"] as? String
        cell.timeLab.text = dic["time"] as? String
        cell.needCount.text = String.init(format: "需: %d人", dic["needCount"] as! Int)
        cell.hadCount.text = String.init(format: "已报: %d人", dic["hadCount"] as! Int)
        cell.ConfirmBtn.addTarget(self, action: #selector(confirAction(btn:)), for: .touchUpInside)
        return cell
    }
}
