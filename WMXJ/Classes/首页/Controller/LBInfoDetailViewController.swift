//
//  LBInfoDetailViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/7.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBInfoDetailViewController: LBBaseViewController {

    var tableView:UITableView?
    
    var pageFlowView:SDCycleScrollView?
    
    var dataDic = NSDictionary()
    
    var leftBack = UIButton(type: .custom)
    
    var commentArray = NSArray()
    
    var headBG = UIView()
    
    var nameLab = UILabel()
    
    var contenLab = UILabel()
    
    var sectionHead = UIView()
    
    var likeBtn = UIButton(type: .custom)
    
    var collectCount = 10290
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUPUI()
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        commentArray = NSArray(array:  [["name":"峦山美地","heacIcon":"t3","timeStr":"12:23","content":"如何修改autolayout 约束的值?\n前面的文章已经讲到如何使用storyboard 创建约束了,但是在实际的开发中我们经常需要适配不同的屏幕尺寸和系统版本,这时我们就 需要用代码对 我们的布局进行适当的调整了,\n先来介绍第2种方法:直接修改 约束的值 ,这是最直接最简单,官方推荐的方法!比移除 约束再添加约束省事不少!\n首先咱们来拖拽一个 view到 viewController上,设置好 上左宽高的值,确定 view的位置:\n效果和约束值如下:"],["name":"灯塔","heacIcon":"t2","timeStr":"12:06","content":"文明","img":["commentp3"]],["name":"土豆泥","heacIcon":"t1","timeStr":"11:07","content":"UIStack View如何让你的开发更简单（iOS 9和Xcode 7）\n2015-08-19 11:20 编辑： suiling 分类：iOS开发 来源：appcoda,UIStack View如何让你的开发更简单（iOS 9和Xcode 7）\n2015-08-19 11:20 编辑： suiling 分类：iOS开发 来源：appcoda\nUIStack View如何让你的开发更简单（iOS 9和Xcode 7）\n2015-08-19 11:20 编辑： suiling 分类：iOS开发 来源：appcoda"],["name":"Haodafeng","heacIcon":"t3","timeStr":"11:15","content":"解决在 viewDidLoad中 修改 约束值失败的问题"]])
        
        var nameStr = ""
        if let name = dataDic["name"] as? String{
            nameStr = name
        }
        nameLab.text = nameStr
        nameLab.sizeToFit()
        
        contenLab.frame = CGRect(x: 12, y: nameLab.bottom + 10, width: ScreenSize_Width - 12, height: 130)
        var contentStr = ""
        if let name = dataDic["content"] as? String{
            contentStr = name
        }
        let paraStyle01 = NSMutableParagraphStyle.init()
        paraStyle01.alignment = .left
        paraStyle01.headIndent = 0
        let emptylen = self.contenLab.font.pointSize * 2
        paraStyle01.firstLineHeadIndent = emptylen
        paraStyle01.lineSpacing = 6
        paraStyle01.tailIndent = 0
        let atrText = NSAttributedString(string: contentStr, attributes: [NSAttributedStringKey.paragraphStyle:paraStyle01])
        self.contenLab.attributedText = atrText
        contenLab.sizeToFit()
        
        headBG.height = contenLab.bottom + 20
        tableView?.reloadData()
    }
    
    func setUPUI(){
        var imgName = "lbbanner"
        if let img = self.dataDic["img"] as? String{
            imgName = img
        }
        self.pageFlowView = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Width * 185 / 375), delegate: self, placeholderImage: UIImage.init(named: imgName))
        self.pageFlowView?.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        self.pageFlowView?.currentPageDotColor = LXSize.baseColor()
        self.pageFlowView?.bannerImageViewContentMode = .scaleAspectFill
        self.pageFlowView?.autoScrollTimeInterval = 4
        
        headBG.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Width * 185 / 375 + 170)
        headBG.addSubview(pageFlowView!)
        
        nameLab.frame = CGRect(x: 8, y: pageFlowView!.bottom + 10, width: ScreenSize_Width - 16, height: 20)
        nameLab.numberOfLines = 0
        nameLab.textColor = LXSize.baseColor()
        nameLab.font = UIFont.init(name: "PingFangSC-Medium", size: 15)
        headBG.addSubview(nameLab)
        
        contenLab.frame = CGRect(x: 12, y: nameLab.bottom + 10, width: ScreenSize_Width - 12, height: 130)
        contenLab.numberOfLines = 0
        contenLab.textColor = UIColor.gray
        contenLab.font = UIFont.init(name: "PingFangSC-Regular", size: 13)
        headBG.addSubview(contenLab)
        
        self.tableView = UITableView(frame: CGRect(x:0, y: 0,width: ScreenSize_Width, height:ScreenSize_Height), style: .grouped)
        tableView?.delegate = self;
        tableView?.dataSource = self;
        tableView?.backgroundColor = UIColor.getWithRed(withRed: 242, green: 242, blue: 242)
        tableView?.register(UINib.init(nibName: "LBInfoDetaiCommentTableViewCell", bundle: nil), forCellReuseIdentifier: "LBInfoDetaiCommentTableViewCell")
        self.view.addSubview(tableView!)
        if #available(iOS 11.0, *) {
            self.tableView?.contentInsetAdjustmentBehavior = .never
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView?.tableHeaderView = headBG
        
        sectionHead.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: 36)
        sectionHead.isUserInteractionEnabled = true
        let img = UIImageView.init(frame: CGRect(x: 12, y: 7, width: 23, height: 22))
        img.image = UIImage.init(named: "评论orange")
        sectionHead.addSubview(img)
        
        let lab = UILabel.init(frame: CGRect(x: img.right + 10, y: 0, width: 100, height: 36))
        lab.textColor = UIColor.darkGray
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.text = "评论"
        sectionHead.addSubview(lab)
        
        likeBtn.frame = CGRect(x: ScreenSize_Width - 100, y: 0, width: 90, height: 36)
        likeBtn.setImage(UIImage.init(named: "点赞"), for: .normal)
        likeBtn.setTitle("\(collectCount)", for: .normal)
        likeBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: -10)
        likeBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 0)
        likeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        likeBtn.setTitleColor(UIColor.gray, for: .normal)
        likeBtn.setTitleColor(LXSize.baseColor(), for: .selected)
        likeBtn.addTarget(self, action: #selector(likeBtnAction(btn:)), for: .touchUpInside)
        sectionHead.addSubview(likeBtn)
        
        let line = UIView.init(frame: CGRect(x: 0, y: 0, width: LXSize.ScreenSize_Width(), height: 0.8))
        line.backgroundColor = UIColor.lightGray
        line.alpha = 0.3
        sectionHead.addSubview(line)
        
        leftBack.frame = CGRect(x: 20, y: 30, width: 24 * LXSize.SCREEN_RATE(), height: 24 * LXSize.SCREEN_RATE())
        if StatusBar_Height > 20 {
            leftBack.frame = CGRect(x: 20, y: 40, width: 24 * LXSize.SCREEN_RATE(), height: 24 * LXSize.SCREEN_RATE())
        }
        leftBack.setBackgroundImage(UIImage.init(named: "backIcon"), for: .normal)
        leftBack.addTarget(self, action: #selector(leftBackAction), for: .touchUpInside)
        self.view.addSubview(leftBack)
    }
    
    @objc func likeBtnAction(btn:UIButton){
        btn.isSelected = !btn.isSelected
        if btn.isSelected{
            collectCount = collectCount + 1
        }else{
            collectCount = collectCount - 1
        }
        self.likeBtn.setTitle("\(collectCount)", for: .normal)
    }
    
    @objc func leftBackAction(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

}

extension LBInfoDetailViewController: UITableViewDelegate, UITableViewDataSource,SDCycleScrollViewDelegate{
    //点击轮播图
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print(index)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sectionHead
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LBInfoDetaiCommentTableViewCell", for: indexPath) as! LBInfoDetaiCommentTableViewCell
        cell.selectionStyle = .none
        let dic = self.commentArray[indexPath.row] as! NSDictionary
       
        cell.contentLab.text = dic["content"] as? String
        var head = ""
        if let headStr = dic["heacIcon"] as? String{
            head = headStr
        }
        cell.leftIcon.image = UIImage.init(named: head)
        cell.leftIcon.layer.cornerRadius = 25
        cell.leftIcon.layer.masksToBounds = true
        cell.timeLab.text = dic["timeStr"] as? String
        cell.nameLab.text = dic["name"] as? String
        return cell
    }
}
