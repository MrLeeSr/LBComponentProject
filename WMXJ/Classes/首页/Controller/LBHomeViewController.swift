//
//  LBHomeViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/4.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBHomeViewController: LBBaseViewController {

    var collectionView:UICollectionView?
    
    var notifyDataArray = [["name":"江宁区林业局举办新型职业农民培训传播休闲农业发展新理念","img":"lbhardCodeImg","time":"01-07","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/1%E6%B1%9F%E5%AE%81%E5%8C%BA%E6%9E%97%E4%B8%9A%E5%B1%80%E4%B8%BE%E5%8A%9E%E6%96%B0%E5%9E%8B%E2%80%A6%E2%80%A6.png"],["name":"江宁区章村社区开展关爱残疾人走访慰问活动","img":"lbhardCodeImg","time":"01-07","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/2%E3%80%81%E6%B1%9F%E5%AE%81%E5%8C%BA%E7%AB%A0%E6%9D%91%E7%A4%BE%E5%8C%BA%E5%BC%80%E5%B1%95.png"],["name":"王燕文部长近日刊文：推动新时代","img":"lbhardCodeImg","time":"01-07","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/15%E7%8E%8B%E7%87%95%E6%96%87%E9%83%A8%E9%95%BF%E8%BF%91%E6%97%A5%E5%88%8A%E6%96%87.png"],]
    
    var categoryAry = [["name":"志愿服务","img":"志愿服务"],["name":"文明大家谈","img":"文明大家谈"],["name":"理论e学","img":"理论"],["name":"微视听","img":"微视听"] ]
    
    var bottomAry = [["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/9.png","name":"2018——一样的元旦，不一样的而我们","content":"2018我们经历了春的期盼、夏的磨砺、秋的收获、冬的回忆，让“庆祝改革开放40周年”响遍淳化这片沃土。","time":"01-22","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/9+2018%E2%80%94%E2%80%94%E4%B8%80%E6%A0%B7%E7%9A%84%E5%85%83%E6%97%A6%EF%BC%8C%E4%B8%8D%E4%B8%80%E6%A0%B7%E7%9A%84%E8%80%8C%E6%88%91%E4%BB%AC.png"],
                     ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/11.png","name":"“旦愿有你”双旦嘉年华","content":"送走了硕果累累的2018，迎来了充满希望的2019。","time":"01-07","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/11%E2%80%9C%E6%97%A6%E6%84%BF%E6%9C%89%E4%BD%A0%E2%80%9D%E5%8F%8C%E6%97%A6%E5%98%89%E5%B9%B4%E5%8D%8E.png"],
                     ]
    
    var pageFlowView:SDCycleScrollView?
    
    var bannerAry = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        setUPUI()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        bannerAry = NSArray(array: [""])
        self.pageFlowView?.imageURLStringsGroup = bannerAry as? [Any];
    }
    
    func setUPUI(){
        
        self.view.backgroundColor = UIColor.white
        
        self.pageFlowView = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: ScreenSize_Width, height: ScreenSize_Width * 185 / 375), delegate: self, placeholderImage: UIImage.init(named: "lbbanner"))
        self.pageFlowView?.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        self.pageFlowView?.currentPageDotColor = LXSize.baseColor()
        self.pageFlowView?.bannerImageViewContentMode = .scaleAspectFill
        self.pageFlowView?.autoScrollTimeInterval = 4
        
        let flowLayout = UICollectionViewFlowLayout()
        var tabheigh:CGFloat = 0
        if self.tabBarController != nil{
            tabheigh = self.tabBarController!.tabBar.height
        }
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView = UICollectionView(frame: CGRect(x:0, y: 0,width: ScreenSize_Width, height:ScreenSize_Height - tabheigh),collectionViewLayout:flowLayout);
        collectionView?.backgroundColor = LXSize.bgViewColor()
        collectionView?.delegate = self;
        collectionView?.dataSource = self;
        collectionView?.autoresizingMask = .flexibleHeight
        // 在注册cell 的同时，别忘了注册header
        collectionView!.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        collectionView?.register(UINib(nibName: "LBHomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBHomeCollectionViewCell")
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "LBUICollectionViewCell")
        collectionView?.register(UINib(nibName: "LBHomeBottomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBHomeBottomCollectionViewCell")
        self.view.addSubview(collectionView!)
        
        if #available(iOS 11.0, *) {
            self.collectionView?.contentInsetAdjustmentBehavior = .never
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    @objc func tapAction(tap:UITapGestureRecognizer){
        let inde = (tap.view!.tag)/100 - 1
        let dic = self.notifyDataArray[inde] as NSDictionary
//        let vc = LBInfoDetailViewController()
//        vc.dataDic = dic
//        self.navigationController?.pushViewController(vc, animated: true)
        let webview = TOWebViewController.init(urlString: dic["url"] as! String)
        webview.navigationButtonsHidden = true
        webview.showUrlWhileLoading = false
        webview.loadingBarTintColor = LXSize.baseColor()
        webview.webTitle = dic["name"] as! String
        webview.buttonTintColor = LXSize.baseColor()
        self.navigationController?.pushViewController(webview, animated: true)
    }
}

extension LBHomeViewController:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SDCycleScrollViewDelegate{
    
    //点击轮播图
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print(index)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return categoryAry.count
        }else if section == 2{
            return bottomAry.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1{
            let size = CGSize(width: (ScreenSize_Width - 1.5)/2.0, height: 50)
            return size
        }else if indexPath.section == 0{
            let size = CGSize(width:ScreenSize_Width, height: 140)
            return size
        }else if indexPath.section == 2{
            let size = CGSize(width:  ScreenSize_Width, height: 150)
            return size
        }else{
            let size = CGSize(width:  ScreenSize_Width, height: ((ScreenSize_Width) * 150)/375.0)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 1{
            return 1.5
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 1{
            return 1.5
        }else if section == 2{
            return 5
        }
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBHomeCollectionViewCell", for: indexPath) as! LBHomeCollectionViewCell
            cell.backgroundColor = UIColor.white
            cell.leftIcon.image = UIImage.init(named: "p2")
            cell.leftIcon.contentMode = .scaleAspectFill
            cell.leftIcon.layer.cornerRadius = 3
            cell.leftIcon.layer.masksToBounds = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.title1.addGestureRecognizer(tap)
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.timeLabel1.addGestureRecognizer(tap1)
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.title2.addGestureRecognizer(tap2)
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.timeLabel2.addGestureRecognizer(tap3)
            
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.title3.addGestureRecognizer(tap4)
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.timeLabel3.addGestureRecognizer(tap5)
            
            let tap6 = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.title4.addGestureRecognizer(tap6)
            let tap7 = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            cell.timeLabel4.addGestureRecognizer(tap7)
            if self.notifyDataArray.count > 0{
                let dic = self.notifyDataArray[0] as NSDictionary
                cell.title1.text = dic["name"] as? String
                cell.timeLabel1.text = dic["time"] as? String
            }
            
            if self.notifyDataArray.count > 1{
                let dic = self.notifyDataArray[1] as NSDictionary
                cell.title2.text = dic["name"] as? String
                cell.timeLabel2.text = dic["time"] as? String
            }
            
            if self.notifyDataArray.count > 2{
                let dic = self.notifyDataArray[2] as NSDictionary
                cell.title3.text = dic["name"] as? String
                cell.timeLabel3.text = dic["time"] as? String
            }
            
            if self.notifyDataArray.count > 3{
                let dic = self.notifyDataArray[3] as NSDictionary
                cell.title4.text = dic["name"] as? String
                cell.timeLabel4.text = dic["time"] as? String
            }
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBUICollectionViewCell", for: indexPath)
            cell.backgroundColor = UIColor.white
            for vi in cell.contentView.subviews{
                vi.removeFromSuperview()
            }
            let wid = (ScreenSize_Width - 1.5)/2.0
            let bg = UIView(frame: CGRect(x: 0, y: 0, width: wid, height: 50))
            bg.backgroundColor = UIColor.white
            let img = UIImageView(frame: CGRect(x: (wid - 150)/2.0, y: (50 - 23)/2.0, width: 23, height: 23))
            bg.addSubview(img)
            cell.contentView.addSubview(bg)
            let dic = self.categoryAry[indexPath.row]
            var imgStr = ""
            if let img = dic["img"] as? String{
                imgStr = img
            }
            img.sd_setImage(with: URL.init(string: imgStr), placeholderImage: UIImage.init(named: imgStr), options: .continueInBackground, completed: nil)
            
            let lab = UILabel.init(frame: CGRect(x: img.right + 15, y: 0, width: 110, height: 50))
            lab.font = UIFont.init(name: "PingFangSC-Medium", size: 15)
            lab.textColor = LXSize.fontColor()
            lab.text = dic["name"] as? String
            bg.addSubview(lab)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBHomeBottomCollectionViewCell", for: indexPath) as! LBHomeBottomCollectionViewCell
            cell.backgroundColor = UIColor.white
            let dic = self.bottomAry[indexPath.row]
            var imgStr = ""
            if let img = dic["img"] as? String{
                imgStr = img
            }
            cell.leftIcon.sd_setImage(with: URL.init(string: imgStr), placeholderImage: UIImage.init(named: imgStr), options: .continueInBackground, completed: nil)
            cell.leftIcon.contentMode = .scaleAspectFill
            cell.leftIcon.layer.cornerRadius = 3
            cell.leftIcon.layer.masksToBounds = true
            
            cell.titleLab.text = dic["name"] as? String
            cell.contentLab.text = dic["content"] as? String
            cell.timeLab.text = dic["time"] as? String
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reuseableView : UICollectionReusableView!
        if kind == UICollectionElementKindSectionHeader {
            let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath)
            for vi in headView.subviews{
                vi.removeFromSuperview()
            }
            
            if indexPath.section == 0{
                //轮播图加载
                if self.pageFlowView != nil{
                    headView.addSubview(pageFlowView!)
                }
                let lab = UILabel()
                lab.frame = CGRect(x: 12, y:ScreenSize_Width * 185 / 375 + 10, width: 100, height: 20)
                lab.text = "📣 通知公告"
                lab.font = UIFont.systemFont(ofSize: 15)
                lab.textColor = UIColor.darkGray
                headView.addSubview(lab)
                let moreBtn = UIButton()
                moreBtn.frame = CGRect(x: ScreenSize_Width - 110, y:ScreenSize_Width * 185 / 375 +  5, width: 100, height: 30)
                moreBtn.setImage(UIImage.init(named: "箭头"), for: .normal)
                moreBtn.setTitleColor(UIColor.gray, for: .normal)
                moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -90)
                moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5)
                moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                moreBtn.setTitle("更多", for: .normal)
                //                moreBtn.addTarget(self, action:#selector(moreActivities(_:)), for:.touchUpInside)
                headView.addSubview(moreBtn)
            }else if indexPath.section == 2{
                let lab = UILabel()
                lab.frame = CGRect(x: 12, y: 13, width: 100, height: 20)
                lab.text = "➮ 民生信息"
                lab.font = UIFont.systemFont(ofSize: 15)
                lab.textColor = UIColor.darkGray
                headView.addSubview(lab)
                let moreBtn = UIButton()
                moreBtn.frame = CGRect(x: ScreenSize_Width - 110, y: 8, width: 100, height: 27)
                moreBtn.setImage(UIImage.init(named: "箭头"), for: .normal)
                moreBtn.setTitleColor(UIColor.gray, for: .normal)
                moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -90)
                moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5)
                moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//                moreBtn.addTarget(self, action:#selector(moreRecommendation(_:)), for:.touchUpInside)
                moreBtn.setTitle("更多", for: .normal)
                headView.addSubview(moreBtn)
            }
            reuseableView = headView
        }
        return reuseableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        if section == 0{
            return CGSize(width:  ScreenSize_Width, height: ScreenSize_Width * 185 / 375 + 40)
        }else if section == 2{
            return CGSize(width:  ScreenSize_Width, height: 40)
        }else{
            return CGSize(width:  ScreenSize_Width, height: 5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if indexPath.row == 0{
                let vc = LBVolunteerViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexPath.row == 1{
                let vc = LBWmdjtViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexPath.row == 2{
                let vc = LBInformationListViewController()
                vc.setLBTitle(str: "理论e学")
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexPath.row == 3{
                let vc = LBMicroVideoViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }else if indexPath.section == 2{
//            let vc = LBInfoDetailViewController()
//            vc.dataDic = bottomAry[indexPath.row] as NSDictionary
//            self.navigationController?.pushViewController(vc, animated: true)
            let dic = bottomAry[indexPath.row] as NSDictionary
            
            let webview = TOWebViewController.init(urlString: dic["url"] as! String)
            webview.navigationButtonsHidden = true
            webview.showUrlWhileLoading = false
            webview.loadingBarTintColor = LXSize.baseColor()
            webview.webTitle = dic["name"] as! String
            webview.buttonTintColor = LXSize.baseColor()
            self.navigationController?.pushViewController(webview, animated: true)
        }
    }
    
}
