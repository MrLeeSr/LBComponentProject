//
//  LBMicroVideoViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/7.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBMicroVideoViewController: LBBaseViewController {

    var video: YZDemoVideo?
    
    var playerView: YZPlayerView?
    
    let tabview = UITableView(frame: .zero, style: .grouped)
    
    var dataAry = NSArray()
    
    var headBG = UIView()
    
    var headTitle = UILabel()
    
    var sectionHead = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }

    func loadData(){
        let ary = [["img":"lbhardCodeImg","name":"习近平讲故事：四知拒金","time":"2018.12.17","url":"http://tv.people.com.cn/n1/2018/1022/c421875-30355371.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：贫困马克思写就《资本论》","time":"2018.12.15","url":"http://tv.people.com.cn/n1/2018/1024/c421875-30359475.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：心中的鼓岭","time":"2018.12.14","url":"http://tv.people.com.cn/n1/2018/1026/c421875-30363902.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：新加坡的郑和宝船","time":"2018.12.13","url":"http://tv.people.com.cn/n1/2018/1029/c421875-30368319.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：寻乌调查","time":"2018.12.13","url":"http://tv.people.com.cn/n1/2018/1031/c421875-30373405.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：康熙不取灵芝","time":"2018.12.13","url":"http://tv.people.com.cn/n1/2018/1102/c421875-30378577.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：谷文昌的“潜绩”","time":"2018.12.13","url":"http://tv.people.com.cn/n1/2018/1105/c421875-30382199.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：“非爱不可”妈妈团体","time":"2018.12.13","url":"http://tv.people.com.cn/n1/2018/1107/c421875-30386687.html"],
                   ["img":"lbhardCodeImg","name":"习近平讲故事：白马驮经与玄奘西行","time":"2018.12.13","url":"http://tv.people.com.cn/n1/2018/1109/c421875-30390968.html"]]
        self.dataAry = NSArray(array: ary)
        self.tabview.reloadData()
        
        headTitle.text = "视频资讯"
        
        let videoDic = [
            "video_id": 127,
            "poster": "https://mu.mumov.com/CJVjBgnXKoeT2qAoxUietKpLYn?imageMogr2/crop/!850x531.25a132a0",
            "play_address": "https://s3.cn-north-1.amazonaws.com.cn/shitianxiahd/videoLB/sp15-daren.mp4",
            "title": "视频资讯",
            "detail": "暂无",
            "director": "njyl",
            "actor": "无",
            "comment_number": 0,
            "like_number": 1,
            "share_number": 0,
            "status": 1,
            "time": 1482746001,
            "charge": 0,
            "user_id": 1,
            "view_number": 7,
            "length": 235,
            "play_id": 0,
            "chapter": 0,
            "type": 0
            ] as [String : Any]
        
        weak var weakSelf = self
        setupData(success: {
            weakSelf?.playerView = YZPlayerView()
            weakSelf?.playerView?.video = self.video
            weakSelf?.playerView?.delegate = self
            weakSelf?.playerView?.needAutoPlay = true
            weakSelf?.playerView?.containerController = self
            
            weakSelf?.headBG.addSubview(playerView!)
            weakSelf?.playerView?.play()
        }, dic: videoDic)
    }
    
    func setupData(success: ()->Void  , dic:[String:Any]) {
//        let path = Bundle.main.bundlePath
//        let filePath = path+"/video"
        print(dic)
        video = YZDemoVideo(dict: dic)
        video?.play_address = "https://s3.cn-north-1.amazonaws.com.cn/shitianxiahd/videoLB/sp15-daren.mp4"
        video?.title = "视频资讯"
        success()
        
    }
    
    func setUpUI(){
        
        self.title = "微视听"
        
        self.tabview.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Height)
        tabview.dataSource = self
        tabview.delegate = self
        tabview.register(UINib.init(nibName: "LBMicroVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "LBMicroVideoTableViewCell")
        self.view.addSubview(tabview)
        
        if #available(iOS 11.0, *) {
            self.tabview.estimatedSectionHeaderHeight = 0;
            self.tabview.estimatedSectionFooterHeight = 0;
            self.tabview.contentInsetAdjustmentBehavior = .never;
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        headBG.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: PlayerViewHeight+clearY + 30)
        headBG.backgroundColor = UIColor.white
        
        headTitle.frame = CGRect(x: 15, y: PlayerViewHeight + 4, width: 100, height: 36)
        headTitle.textColor = UIColor.darkGray
        headTitle.font = UIFont.systemFont(ofSize: 14)
        headBG.addSubview(headTitle)
        self.tabview.tableHeaderView = headBG
        
        sectionHead.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: 36)
        let img = UIImageView.init(frame: CGRect(x: 15, y: 9, width: 25, height: 18))
        img.image = UIImage.init(named: "往期视频")
        sectionHead.addSubview(img)
        
        let lab = UILabel.init(frame: CGRect(x: img.right + 10, y: 0, width: 100, height: 36))
        lab.textColor = UIColor.darkGray
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.text = "往期视频"
        sectionHead.addSubview(lab)
        
        let line = UIView.init(frame: CGRect(x: 0, y: 0, width: LXSize.ScreenSize_Width(), height: 0.7))
        line.backgroundColor = UIColor.lightGray
        line.alpha = 0.18
        sectionHead.addSubview(line)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.automaticallyAdjustsScrollViewInsets = false
        playerView?.delegate = self
        playerView?.needAutoPlay = true
        UIApplication.shared.statusBarStyle = .lightContent
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        //UIApplication.shared.statusBarStyle = .default
        
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        playerView?.needAutoPlay = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "videoVCDidDisappear"), object: nil)
        UIApplication.shared.statusBarStyle = .default
        playerView?.delegate = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    deinit {
        print("deinit")
    }

    override var shouldAutorotate : Bool{
        return false
    }
}

extension LBMicroVideoViewController:UITableViewDelegate,UITableViewDataSource,YZPlayerViewDelegate{
    func lbrotating() {
        //把按钮放到最前
//        self.view.bringSubview(toFront: addShici)
    }
    
    func backAction() {
        print("back")
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 喜欢video
    func likeAction(isLike: Bool) {
        isLike ? print("liked") : print("dislike")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sectionHead
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabview.dequeueReusableCell(withIdentifier: "LBMicroVideoTableViewCell", for: indexPath) as! LBMicroVideoTableViewCell
        cell.selectionStyle = .none
        let dic = self.dataAry[indexPath.row] as! NSDictionary
        var img = ""
        if let imgStr = dic["img"] as? String{
            img = imgStr
        }
        cell.lbLeftIcon.image = UIImage.init(named: img)
        cell.lbLeftIcon.layer.masksToBounds = true
        cell.lbLeftIcon.layer.cornerRadius = 3
        cell.lbLeftIcon.contentMode = .scaleAspectFill
        cell.nameLab.text = dic["name"] as? String
        cell.timeLab.text = dic["time"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dic = dataAry[indexPath.row] as! NSDictionary
        
        let webview = TOWebViewController.init(urlString: dic["url"] as! String)
        webview.navigationButtonsHidden = true
        webview.showUrlWhileLoading = false
        webview.loadingBarTintColor = LXSize.baseColor()
        webview.webTitle = dic["name"] as! String
        webview.buttonTintColor = LXSize.baseColor()
        self.navigationController?.pushViewController(webview, animated: true)
    }
}
