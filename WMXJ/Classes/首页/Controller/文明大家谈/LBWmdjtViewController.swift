//
//  LBWmdjtViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/7.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBWmdjtViewController: LBBaseViewController {

    let tabview = UITableView(frame: .zero, style: .grouped)
    
    let page3Title = ["网上好人馆","网上贤乡馆","文明大家谈","ceshi"]
    
    var dataAry = NSArray()
    
    var page3HeadView = UIScrollView()
    
    let bottomLine = UIView()
    
    var bgScroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let ary = [["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/4.png","name":"秣陵为群众送上“法治礼包”","time":"2018.12.17","content":"近日,秣陵街道组织辖区司法所,综治办,劳保所等17家普法成员单位,在胜太社区广场开展了一场普法宣传活动。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/4%E7%A7%A3%E9%99%B5%E4%B8%BA%E7%BE%A4%E4%BC%97%E9%80%81%E4%B8%8A%E2%80%9C%E6%B3%95%E6%B2%BB%E7%A4%BC%E5%8C%85%E2%80%9D.png"],
                   ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/10.png","name":"淳化人——不畏严寒御雪行动","time":"2018.12.15","content":"12月30日中午前后江宁全区开始出现降雪，咱们大淳化也开始飘起2018年最后一场雪……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/10%E6%B7%B3%E5%8C%96%E4%BA%BA%E2%80%94%E2%80%94%E4%B8%8D%E7%95%8F%E4%B8%A5%E5%AF%92%E5%BE%A1%E9%9B%AA%E8%A1%8C%E5%8A%A8.png"],
                   ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/13.png","name":"文明礼仪进社区||新农社区开展新时代文明实践理论宣讲活动","time":"2018.12.15","content":"1月9日下午,湖熟街道新农社区开展新时代文明实践站理论宣讲活动,邀请街道关工委佘春生老师进行授课...","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/13.jpg"],
                   ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/15.jpg","name":"王燕文部长近日刊文","time":"2018.12.15","content":"推动新时代文明实践中心建设工作走在前列","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/15content.jpg"],]
        self.dataAry = NSArray(array: ary)
        self.tabview.reloadData()
    }
    
    func setUpUI(){
        self.title = "文明大家谈"
        
        self.page3HeadView.frame = CGRect(x: 0, y: 3, width: ScreenSize_Width, height: 40)
        self.page3HeadView.backgroundColor = UIColor.white
        self.page3HeadView.contentSize = CGSize(width: CGFloat(self.page3Title.count) * (ScreenSize_Width / 3.0), height: 40)
        self.page3HeadView.showsVerticalScrollIndicator = false
        self.page3HeadView.showsHorizontalScrollIndicator = false
        
        bottomLine.frame = CGRect(x: 0, y: 37, width: ScreenSize_Width / 3.0, height: 3)
        bottomLine.layer.cornerRadius = 1.5
        bottomLine.backgroundColor = LXSize.baseColor()
        for i in 0..<self.page3Title.count{
            let iStr = self.page3Title[i]
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: (ScreenSize_Width / 3.0) * CGFloat(i), y: 0, width: ScreenSize_Width / 3.0, height: 40)
            btn.setTitle(iStr, for: .normal)
            btn.titleLabel?.font = UIFont.init(name: "AlNile", size: 14)
            btn.setTitleColor(LXSize.baseColor(), for: .selected)
            btn.setTitleColor(UIColor.lightGray, for: .normal)
            btn.addTarget(self, action: #selector(page3TitleBtnAction(btn:)), for: .touchUpInside)
            btn.tag = Int(200 + i)
            self.page3HeadView.addSubview(btn)
            if i == 0{
                btn.isSelected = true
            }
        }
        self.page3HeadView.addSubview(bottomLine)
        self.view.addSubview(page3HeadView)
        
        self.bgScroll.frame = CGRect(x: 0, y: 43, width: ScreenSize_Width, height: ScreenSize_Height - StatusBar_Height - 43 - 44)
        self.view.addSubview(self.bgScroll)
        self.bgScroll.delegate = self
        self.bgScroll.showsVerticalScrollIndicator = false
        self.bgScroll.showsHorizontalScrollIndicator = false
        self.bgScroll.isPagingEnabled = true
        self.bgScroll.contentSize = CGSize(width: ScreenSize_Width * 3, height: ScreenSize_Height - StatusBar_Height - 43 - 44)
        
        let webV = TOWebViewController(urlString: "http://zt.longhoo.net/html/jnniceperson2018/?from=singlemessage")
        webV.navigationButtonsHidden = true
        webV.view.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - 43 - 44 - StatusBar_Height)
        self.addChildViewController(webV)
        self.bgScroll.addSubview(webV.view)
        
        let webV1 = TOWebViewController(urlString: "https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/xianxiangguan.jpg")
        webV1.navigationButtonsHidden = true
        webV1.view.frame = CGRect(x: ScreenSize_Width, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - 43 - 44 - StatusBar_Height)
        self.addChildViewController(webV1)
        self.bgScroll.addSubview(webV1.view)
        
        self.tabview.frame = CGRect(x: ScreenSize_Width * 2, y: 0, width: ScreenSize_Width, height: ScreenSize_Height - 43 - 44 - StatusBar_Height)
        tabview.dataSource = self
        tabview.delegate = self
        tabview.register(UINib.init(nibName: "LBInformationTableViewCell", bundle: nil), forCellReuseIdentifier: "LBInformationTableViewCell")
        self.bgScroll.addSubview(tabview)
        
        if #available(iOS 11.0, *) {
            self.tabview.estimatedSectionHeaderHeight = 0;
            self.tabview.estimatedSectionFooterHeight = 0;
            self.tabview.contentInsetAdjustmentBehavior = .never;
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    @objc func page3TitleBtnAction(btn:UIButton){
        for i in self.page3HeadView.subviews{
            if i is UIButton{
                let btn = i as! UIButton
                btn.isSelected = false
            }
        }
        btn.isSelected = true
        self.bgScroll.setContentOffset(CGPoint(x: CGFloat(btn.tag - 200) * ScreenSize_Width, y: 0), animated: true)
    }
    
}
extension LBWmdjtViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.bgScroll{
            self.bottomLine.left = (scrollView.contentOffset.x * ScreenSize_Width) / (ScreenSize_Width * 3)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.bgScroll{
            for i in self.page3HeadView.subviews{
                if i is UIButton{
                    let btn = i as! UIButton
                    btn.isSelected = false
                    if btn.tag == Int(scrollView.contentOffset.x/ScreenSize_Width + 200){
                        btn.isSelected = true
                        
                    }
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabview.dequeueReusableCell(withIdentifier: "LBInformationTableViewCell", for: indexPath) as! LBInformationTableViewCell
        cell.selectionStyle = .none
        let dic = self.dataAry[indexPath.row] as! NSDictionary
        var img = ""
        if let imgStr = dic["img"] as? String{
            img = imgStr
        }
        cell.leftIcon.sd_setImage(with: URL.init(string: img), placeholderImage: UIImage.init(named: img), options: .continueInBackground, completed: nil)
        cell.leftIcon.layer.masksToBounds = true
        cell.leftIcon.layer.cornerRadius = 3
        cell.leftIcon.contentMode = .scaleAspectFill
        cell.nameLab.text = dic["name"] as? String
        cell.contentLab.text = dic["content"] as? String
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
