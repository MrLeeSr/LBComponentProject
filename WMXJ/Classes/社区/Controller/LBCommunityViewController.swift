//
//  LBCommunityViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/4.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBCommunityViewController: LBBaseViewController {

    var recommendedBtn = UIButton(type: .custom)
    
    var neighborBtn = UIButton(type: .custom)
    
    var titleBottomLine = UIView()
    
    var bgScroll = UIScrollView()
    
    var tab1 = UITableView(frame: CGRect.zero, style: .grouped)
    
    var tab2 = UITableView(frame: CGRect.zero, style: .grouped)
    
    var dataAry = NSArray()
    
    var dataAry1 = NSArray()
    
    var tab1Head = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        self.dataAry = [["name":"Haodafeng","heacIcon":"t1","timeStr":"12:23","content":"如何修改autolayout 约束的值?\n前面的文章已经讲到如何使用storyboard 创建约束了,但是在实际的开发中我们经常需要适配不同的屏幕尺寸和系统版本,这时我们就 需要用代码对 我们的布局进行适当的调整了,\n先来介绍第2种方法:直接修改 约束的值 ,这是最直接最简单,官方推荐的方法!比移除 约束再添加约束省事不少!\n首先咱们来拖拽一个 view到 viewController上,设置好 上左宽高的值,确定 view的位置:\n效果和约束值如下:","img":["commentp2","commentp5"]],
                        ["name":"灯塔","heacIcon":"t2","timeStr":"12:06","content":"文明","img":["commentp1"]],
                        ["name":"土豆泥","heacIcon":"t3","timeStr":"11:07","content":"UIStack View如何让你的开发更简单（iOS 9和Xcode 7）\n2015-08-19 11:20 编辑： suiling 分类：iOS开发 来源：appcoda","img":["commentp3","commentp4","commentp2","commentp6","commentp5"]],
                        ["name":"峦山美地","heacIcon":"t1","timeStr":"10:15","content":"解决在 viewDidLoad中 修改 约束值失败的问题","img":[]]]
        self.dataAry1 = [["name":"峦山美地","heacIcon":"t3","timeStr":"12:23","content":"如何修改autolayout 约束的值?\n前面的文章已经讲到如何使用storyboard 创建约束了,但是在实际的开发中我们经常需要适配不同的屏幕尺寸和系统版本,这时我们就 需要用代码对 我们的布局进行适当的调整了,\n先来介绍第2种方法:直接修改 约束的值 ,这是最直接最简单,官方推荐的方法!比移除 约束再添加约束省事不少!\n首先咱们来拖拽一个 view到 viewController上,设置好 上左宽高的值,确定 view的位置:\n效果和约束值如下:","img":["commentp1","commentp2"]],
                         ["name":"灯塔","heacIcon":"t2","timeStr":"12:06","content":"文明","img":["commentp3"]],
                         ["name":"土豆泥","heacIcon":"t1","timeStr":"11:07","content":"UIStack View如何让你的开发更简单（iOS 9和Xcode 7）\n2015-08-19 11:20 编辑： suiling 分类：iOS开发 来源：appcoda","img":["commentp4","commentp5","commentp6","commentp1","commentp3"]],
                         ["name":"Haodafeng","heacIcon":"t3","timeStr":"11:15","content":"解决在 viewDidLoad中 修改 约束值失败的问题","img":[]]]
    }
    
    func setUpUI(){
        
        let titleBG = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        self.navigationItem.titleView = titleBG
        
        self.recommendedBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        self.recommendedBtn.setTitle("推荐", for: .normal)
        self.recommendedBtn.titleLabel?.font = UIFont.init(name: "AlNile", size: 14)
        self.recommendedBtn.setTitleColor(LXSize.baseColor(), for: .selected)
        self.recommendedBtn.setTitleColor(UIColor.lightGray, for: .normal)
        self.recommendedBtn.addTarget(self, action: #selector(titleBtnAction(btn:)), for: .touchUpInside)
        self.recommendedBtn.isSelected = true
        titleBG.addSubview(recommendedBtn)
        
        self.neighborBtn.frame = CGRect(x: 60, y: 0, width: 60, height: 30)
        self.neighborBtn.setTitle("附近", for: .normal)
        self.neighborBtn.titleLabel?.font = UIFont.init(name: "AlNile", size: 14)
        self.neighborBtn.setTitleColor(LXSize.baseColor(), for: .selected)
        self.neighborBtn.setTitleColor(UIColor.lightGray, for: .normal)
        self.neighborBtn.addTarget(self, action: #selector(titleBtnAction(btn:)), for: .touchUpInside)
        titleBG.addSubview(neighborBtn)
        
        titleBottomLine.frame = CGRect(x: 0, y: 27, width: 60, height: 3)
        titleBottomLine.backgroundColor = LXSize.baseColor()
        titleBottomLine.layer.cornerRadius = 1.5
        titleBG.addSubview(titleBottomLine)
        
        tab1Head.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: 100)
        tab1Head.backgroundColor = LXSize.bgViewColor()
        let imgAry = ["CommunityHead1.jpg","CommunityHead2.jpg","CommunityHead3.jpg","CommunityHead4.jpg"]
        let labTit = ["全部","物业","邻里","亲子"]
        for i in 0..<4{
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 15 + (60 + 15) * CGFloat(i), y: 10, width: 60, height: 60)
            btn.setBackgroundImage(UIImage.init(named: imgAry[i]), for: .normal)
            tab1Head.addSubview(btn)
            
            let lab = UILabel.init(frame: CGRect(x: btn.left, y: btn.bottom + 3, width: 60, height: 20))
            lab.font = UIFont.systemFont(ofSize: 14)
            lab.textColor = LXSize.fontColor()
            lab.textAlignment = .center
            lab.text = labTit[i]
            tab1Head.addSubview(lab)
        }
        
        var tabHeigh:CGFloat = 0
        if self.tabBarController != nil{
            tabHeigh = self.tabBarController!.tabBar.height
        }
        self.bgScroll.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - StatusBar_Height - tabHeigh - 44)
        self.view.addSubview(self.bgScroll)
        self.bgScroll.delegate = self
        self.bgScroll.showsVerticalScrollIndicator = false
        self.bgScroll.showsHorizontalScrollIndicator = false
        self.bgScroll.isPagingEnabled = true
        self.bgScroll.contentSize = CGSize(width: ScreenSize_Width * 2, height: ScreenSize_Height - StatusBar_Height - tabHeigh - 44)
        
        self.tab1.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - StatusBar_Height - tabHeigh - 44)
        self.tab1.dataSource = self
        self.tab1.delegate = self
        self.tab1.register(UINib(nibName: "LBBBSTableViewCell", bundle: nil), forCellReuseIdentifier: "LBBBSTableViewCell")
        self.bgScroll.addSubview(self.tab1)
        
        self.tab2.frame = CGRect(x: ScreenSize_Width, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - StatusBar_Height - tabHeigh - 44)
        self.tab2.dataSource = self
        self.tab2.delegate = self
        self.tab2.register(UINib(nibName: "LBBBSTableViewCell", bundle: nil), forCellReuseIdentifier: "LBBBSTableViewCell1")
        self.bgScroll.addSubview(self.tab2)
        
        if #available(iOS 11.0, *) {
            self.tab1.estimatedSectionHeaderHeight = 0;
            self.tab1.estimatedSectionFooterHeight = 0;
            self.tab2.estimatedSectionHeaderHeight = 0;
            self.tab2.estimatedSectionFooterHeight = 0;
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }

    }
    
    @objc func titleBtnAction(btn:UIButton){
        if btn == self.recommendedBtn{
            btn.isSelected = true
            self.neighborBtn.isSelected = false
            self.bgScroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }else{
            btn.isSelected = true
            self.recommendedBtn.isSelected = false
            self.bgScroll.setContentOffset(CGPoint(x: ScreenSize_Width, y: 0), animated: true)
        }
    }

}
extension LBCommunityViewController:UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tab1{
            return 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tab1{
            return self.dataAry.count
        }else{
            return self.dataAry1.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tab1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LBBBSTableViewCell", for: indexPath) as! LBBBSTableViewCell
            cell.selectionStyle = .none
            let dic = self.dataAry[indexPath.row] as! NSDictionary
            if let imgList = dic["img"] as? NSArray{
                cell.setImgAry(ary: imgList)
            }
            cell.contentLab.text = dic["content"] as? String
            var head = ""
            if let headStr = dic["heacIcon"] as? String{
                head = headStr
            }
            cell.headIcon.image = UIImage.init(named: head)
            cell.headIcon.layer.cornerRadius = 25
            cell.headIcon.layer.masksToBounds = true
            cell.timeLab.text = dic["timeStr"] as? String
            cell.nameLab.text = dic["name"] as? String
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LBBBSTableViewCell1", for: indexPath) as! LBBBSTableViewCell
            cell.selectionStyle = .none
            let dic = self.dataAry1[indexPath.row] as! NSDictionary
            if let imgList = dic["img"] as? NSArray{
                cell.setImgAry(ary: imgList)
            }
            cell.contentLab.text = dic["content"] as? String
            var head = ""
            if let headStr = dic["heacIcon"] as? String{
                head = headStr
            }
            cell.headIcon.image = UIImage.init(named: head)
            cell.headIcon.layer.cornerRadius = 25
            cell.headIcon.layer.masksToBounds = true
            cell.timeLab.text = dic["timeStr"] as? String
            cell.nameLab.text = dic["name"] as? String
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == self.tab1{
            return self.tab1Head
        }
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == self.tab1{
            return 100
        }
        return 0.001
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.bgScroll{
            self.titleBottomLine.left = (scrollView.contentOffset.x * 120) / (ScreenSize_Width * 2)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.bgScroll{
            if scrollView.contentOffset.x == 0{
                self.recommendedBtn.isSelected = true
                self.neighborBtn.isSelected = false
            }else if scrollView.contentOffset.x == ScreenSize_Width{
                self.recommendedBtn.isSelected = false
                self.neighborBtn.isSelected = true
            }
        }
    }
}
