//
//  LBPeerViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/4.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBPeerViewController: LBBaseViewController {

    let titleAry = ["文明实践","民生服务","民意调查","测试用"]
    
    let page3Title = ["全部","曝光","提问","建议","投票","问卷调查","ceshi"]
    
    var titleScroll = UIScrollView()
    
    var bgScroll = UIScrollView()
    
    var titleBottomLine = UIView()
    
    var collectionView1:UICollectionView?
    
    var collectionView2:UICollectionView?
    
    var collectionView3:UICollectionView?
    
    var dataArray = NSDictionary()
    
    var dataArray2 = NSArray()
    
    var dataArray3 = NSArray()
    
    // head两个切换按钮
    var infomationBtn = UIButton(type: .custom)
    
    var activityBtn = UIButton(type: .custom)
    
    var page3HeadView = UIScrollView()
    
    let line = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenSize_Width, height: 4))
    
    var currentBtn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let ary = [ "index0": [ ["img":"创新创业","name":"创新创业"] , ["img":"农民","name":"新型农民"], ["img":"新江宁人","name":"新江宁人"], ["img":"弱势群体","name":"弱势群体"]] ,
                    "index1":[["img":"ActivityImg","time":"2019.09.01","name":"活动名称","content":"活动是由共同目的联合起来并完成一定社会职能的动作的总和。活动由目的、动机和动作构成，具有完整的结构系统。苏联心理学家从20年代起就对活动进行了一系列研究。"] ,["img":"ActivityImg","time":"2019.08.23","name":"活动名称","content":"活动是由共同目的联合起来并完成一定社会职能的动作的总和。活动由目的、动机和动作构成，具有完整的结构系统。苏联心理学家从20年代起就对活动进行了一系列研究。"]],
                    "index2":[ ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/3.png","name":"美丽乡村‘绣“江宁","content":"初夏金陵,绿意盎然,生机勃勃。5月12号,全国副省级城市党报联盟走进江苏省南京市江宁区,一探当地美丽乡村建设的迷人风采","time":"2019.09.01","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/3%E7%BE%8E%E4%B8%BD%E4%B9%A1%E6%9D%91%E2%80%98%E7%BB%A3%E2%80%9C%E6%B1%9F%E5%AE%81.png"],["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/4.png","name":"秣陵为群众送上“法治礼包”","content":"近日,秣陵街道组织辖区司法所,综治办,劳保所等17家普法成员单位,在胜太社区广场开展了一场普法宣传活动。","time":"2019.09.01","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/4%E7%A7%A3%E9%99%B5%E4%B8%BA%E7%BE%A4%E4%BC%97%E9%80%81%E4%B8%8A%E2%80%9C%E6%B3%95%E6%B2%BB%E7%A4%BC%E5%8C%85%E2%80%9D.png"],
                                ],
                    "index3":[ ["count":9926,"img":"lbCivilizationp2","name":"\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台","content":"\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台","time":"2019.09.01"],["count":4226,"img":"lbCivilizationp3","name":"\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台","content":"\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台\"学习强国\"学习平台正式上线仪式举行,学习平台学习平台","time":"2019.09.01"]]
                    ]
        self.dataArray = NSDictionary(dictionary: ary)
        
        let newAry = [
            [["name":"健康地图","img":"jk"],["name":"就医指导","img":"jy"],["name":"医疗服务","img":"yl"]],
            [["name":"演出信息","img":"yc"],["name":"剧目投票","img":"jm"],["name":"免费抢票","img":"mf"],["name":"免阵地预约","img":"zd"],["name":"教育资源","img":"jyzy"]],
            [["name":"住房","img":"zf"],["name":"社保","img":"sb"],["name":"就业","img":"jy1"],["name":"落户","img":"lh"]],
        ]
        dataArray2 = NSArray(array: newAry)
        
        let ary3 = [["categor":"建议","status":"Y","name":"建议公交公司增加临时扫墓直达车","content":"建议:公交公司在清明期间增加义乌商品城一","time":"2018-04-02","img":"p1"],
                    ["categor":"曝光","status":"Y","name":"踏青变\"踏\"青","content":"随着天气转暖,每天到家附近的公园锻炼身体","time":"2018-03-22","img":"p2"],
                    ["categor":"曝光","status":"N","name":"\"接孩子大军\"频现不文明","content":"接近放学时间,上元大街的实验小学门前,到","time":"2018-03-20","img":"lbCivilizationp3"],
                    ["categor":"曝光","status":"N","name":"翻越护栏横穿马路不文明行为","content":"上元大街,金箔路等城区道路换上了崭新的交","time":"2018-03-18","img":"p2"],
                    ["categor":"建议","status":"Y","name":"建议公交公司增加临时扫墓直达车","content":"建议:公交公司在清明期间增加义乌商品城一","time":"2018-04-02","img":"lbCivilizationp3"],
                    ["categor":"曝光","status":"N","name":"\"接孩子大军\"频现不文明","content":"接近放学时间,上元大街的实验小学门前,到","time":"2018-03-20","img":"p1"],
        ]
        self.dataArray3 = NSArray(array: ary3)
    }
    
    func setUpUI(){
        
        self.titleScroll.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width - 30, height: 30)
        self.titleScroll.contentSize = CGSize(width: (ScreenSize_Width - 30)/3 * CGFloat(self.titleAry.count), height: 30)
        self.titleScroll.showsVerticalScrollIndicator = false
        self.titleScroll.showsHorizontalScrollIndicator = false
        self.navigationItem.titleView = self.titleScroll
        
        line.backgroundColor = LXSize.bgViewColor()
        
        var inde:CGFloat = 0
        for i in self.titleAry{
            let iStr = i as String
            let btn = UIButton.init(type: .custom)
            btn.frame = CGRect(x: (ScreenSize_Width - 30)/3 * inde, y: 0, width: (ScreenSize_Width - 30)/3 , height: 30)
            btn.setTitle(iStr, for: .normal)
            btn.titleLabel?.font = UIFont.init(name: "AlNile", size: 14)
            btn.setTitleColor(LXSize.baseColor(), for: .selected)
            btn.setTitleColor(UIColor.lightGray, for: .normal)
            btn.addTarget(self, action: #selector(titleBtnAction(btn:)), for: .touchUpInside)
            btn.tag = Int(100 + inde)
            self.titleScroll.addSubview(btn)
            inde = inde + 1
            if inde == 1{
                btn.isSelected = true
            }
        }
        
        titleBottomLine.frame = CGRect(x: 0, y: 27, width: (ScreenSize_Width - 30)/3, height: 3)
        titleBottomLine.backgroundColor = LXSize.baseColor()
        titleBottomLine.layer.cornerRadius = 1.5
        titleScroll.addSubview(titleBottomLine)
        
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
        self.bgScroll.contentSize = CGSize(width: ScreenSize_Width * CGFloat(self.titleAry.count), height: ScreenSize_Height - StatusBar_Height - tabHeigh - 44)
        
        infomationBtn.frame = CGRect(x: 40, y: 0, width: 80, height: 40)
        infomationBtn.setTitle("热点资讯", for: .normal)
        infomationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        infomationBtn.setTitleColor(LXSize.baseColor(), for: .selected)
        infomationBtn.setTitleColor(UIColor.lightGray, for: .normal)
        infomationBtn.addTarget(self, action: #selector(headTitleBtnAction(btn:)), for: .touchUpInside)
        infomationBtn.isSelected = true
        currentBtn = 0
        activityBtn.frame = CGRect(x: 130, y: 0, width: 80, height: 40)
        activityBtn.setTitle("活动海选", for: .normal)
        activityBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        activityBtn.setTitleColor(LXSize.baseColor(), for: .selected)
        activityBtn.setTitleColor(UIColor.lightGray, for: .normal)
        activityBtn.addTarget(self, action: #selector(headTitleBtnAction(btn:)), for: .touchUpInside)
        setPageOne()
        setPageTwo()
        setPageThree()
    }
    
    //文明实践页
    @objc func setPageOne(){
        let flowLayout = UICollectionViewFlowLayout()
        var tabheigh:CGFloat = 0
        if self.tabBarController != nil{
            tabheigh = self.tabBarController!.tabBar.height
        }
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView1 = UICollectionView(frame: CGRect(x:0, y: 0,width: ScreenSize_Width, height:ScreenSize_Height - tabheigh - StatusBar_Height - 44),collectionViewLayout:flowLayout);
        collectionView1?.backgroundColor = LXSize.bgViewColor()
        collectionView1?.delegate = self;
        collectionView1?.dataSource = self;
        collectionView1?.autoresizingMask = .flexibleHeight
        // 在注册cell 的同时，别忘了注册header
        collectionView1!.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "PeedHeadView")
        collectionView1?.register(UINib(nibName: "LBCivilizationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBCivilizationCollectionViewCell")
        collectionView1?.register(UINib(nibName: "LBCivilization1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBCivilization1CollectionViewCell")
        collectionView1?.register(UINib(nibName: "LBHomeBottomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBCivilization2CollectionViewCell")
        collectionView1?.register(UINib(nibName: "LBCivilization4CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBCivilization4CollectionViewCell")
        
        self.bgScroll.addSubview(collectionView1!)
    }
    
    @objc func setPageTwo(){
        let flowLayout = UICollectionViewFlowLayout()
        var tabheigh:CGFloat = 0
        if self.tabBarController != nil{
            tabheigh = self.tabBarController!.tabBar.height
        }
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView2 = UICollectionView(frame: CGRect(x:ScreenSize_Width, y: 0,width: ScreenSize_Width, height:ScreenSize_Height - tabheigh - StatusBar_Height - 44),collectionViewLayout:flowLayout);
        collectionView2?.backgroundColor = UIColor.white
        collectionView2?.delegate = self;
        collectionView2?.dataSource = self;
        collectionView2?.autoresizingMask = .flexibleHeight
        // 在注册cell 的同时，别忘了注册header
        collectionView2!.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "PeedHeadView1")
        collectionView2?.register(UINib(nibName: "LBCivilizationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBCivilizationCollectionViewCell")
        
        self.bgScroll.addSubview(collectionView2!)
    }
    
    @objc func setPageThree(){
        self.page3HeadView.frame = CGRect(x: 0, y: 0, width: ScreenSize_Width, height: 30)
        self.page3HeadView.contentSize = CGSize(width: CGFloat(self.page3Title.count) * (ScreenSize_Width / 6.0), height: 30)
        self.page3HeadView.showsVerticalScrollIndicator = false
        self.page3HeadView.showsHorizontalScrollIndicator = false
        
        for i in 0..<self.page3Title.count{
            let iStr = self.page3Title[i]
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: (ScreenSize_Width / 6.0) * CGFloat(i), y: 10, width: ScreenSize_Width / 6.0, height: 30)
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
        
        let flowLayout = UICollectionViewFlowLayout()
        var tabheigh:CGFloat = 0
        if self.tabBarController != nil{
            tabheigh = self.tabBarController!.tabBar.height
        }
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView3 = UICollectionView(frame: CGRect(x:ScreenSize_Width * 2, y: 0,width: ScreenSize_Width, height:ScreenSize_Height - tabheigh - StatusBar_Height - 44),collectionViewLayout:flowLayout);
        collectionView3?.backgroundColor = UIColor.white
        collectionView3?.delegate = self;
        collectionView3?.dataSource = self;
        collectionView3?.autoresizingMask = .flexibleHeight
        // 在注册cell 的同时，别忘了注册header
        collectionView3!.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "PeedHeadView3")
        collectionView3?.register(UINib(nibName: "LBCivilization3CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBCivilization3CollectionViewCell")
        
        self.bgScroll.addSubview(collectionView3!)
        
        let suspensionBG = UIView(frame: CGRect(x: ScreenSize_Width * 2 + ScreenSize_Width - 40, y: 180, width: 30, height: 80))
        suspensionBG.backgroundColor = UIColor.lightGray
        suspensionBG.isUserInteractionEnabled = true
        suspensionBG.layer.cornerRadius = 15
        self.bgScroll.addSubview(suspensionBG)
        
        let btn1 = UIButton.init(type: .custom)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        btn1.setImage(UIImage.init(named: "pople发布"), for: .normal)
        btn1.addTarget(self, action: #selector(lbAddAction), for: .touchUpInside)
        suspensionBG.addSubview(btn1)
        
        let btn2 = UIButton.init(type: .custom)
        btn2.frame = CGRect(x: 0, y: 40, width: 30, height: 40)
        btn2.setImage(UIImage.init(named: "people历史发布"), for: .normal)
        btn2.addTarget(self, action: #selector(lbAddHistoryAction), for: .touchUpInside)
        suspensionBG.addSubview(btn2)
        
        let centerLine = UIView.init(frame: CGRect(x: 0, y: 39.5, width: 30, height: 1))
        centerLine.backgroundColor = UIColor.white
        suspensionBG.addSubview(centerLine)
    }
    
    @objc func lbAddAction(){
        let vc = LBReleaseViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func lbAddHistoryAction(){
        let vc = LBReleaseHistoryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func titleBtnAction(btn:UIButton){
        for i in self.titleScroll.subviews{
            if i is UIButton{
                let btn = i as! UIButton
                btn.isSelected = false
            }
        }
        btn.isSelected = true
        self.bgScroll.setContentOffset(CGPoint(x: CGFloat(btn.tag - 100) * ScreenSize_Width, y: 0), animated: true)
    }
    
    @objc func page3TitleBtnAction(btn:UIButton){
        for i in self.page3HeadView.subviews{
            if i is UIButton{
                let btn = i as! UIButton
                btn.isSelected = false
            }
        }
        btn.isSelected = true
    }

    @objc func headTitleBtnAction(btn:UIButton){
        if btn == infomationBtn{
            btn.isSelected = true
            activityBtn.isSelected = false
            currentBtn = 0
        }else if btn == activityBtn{
            btn.isSelected = true
            infomationBtn.isSelected = false
            currentBtn = 1
        }
        self.collectionView1?.reloadSections([2])
    }
}

extension LBPeerViewController:UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //collectionDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView1{
            return 3
        }else if collectionView == self.collectionView2{
            return self.dataArray2.count
        }else if collectionView == self.collectionView3{
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView1{
            if section == 0{
                if let ary = self.dataArray["index0"] as? NSArray{
                    return ary.count
                }
            }else if section == 1{
                if let ary = self.dataArray["index1"] as? NSArray{
                    return ary.count
                }
            }else if section == 2{
                if let ary = self.dataArray["index2"] as? NSArray{
                    return ary.count
                }
            }
            
        }else if collectionView == self.collectionView2{
            let ary = self.dataArray2[section] as! NSArray
            return ary.count
        }else if collectionView == self.collectionView3{
            return self.dataArray3.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView1{
            if indexPath.section == 1{
                let size = CGSize(width: ScreenSize_Width, height: 170)
                return size
            }else if indexPath.section == 0{
                let size = CGSize(width:ScreenSize_Width / 4.0, height: 90)
                return size
            }else if indexPath.section == 2{
                if currentBtn == 0{
                    let size = CGSize(width:  ScreenSize_Width, height: 150)
                    return size
                }else if currentBtn == 1{
                    let size = CGSize(width:  ScreenSize_Width, height: 120)
                    return size
                }
            }
        }else if collectionView == self.collectionView2{
            let size = CGSize(width:ScreenSize_Width / 4.0, height: 90)
            return size
        }else if collectionView == self.collectionView3{
            return CGSize(width:  ScreenSize_Width, height: 120)
        }
        
        return CGSize(width:  1, height: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.collectionView1{
            return 0
        }else if collectionView == self.collectionView2{
            return 0
        }else if collectionView == self.collectionView3{
            return 0
        }
        return 0.01
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.collectionView1{
            if section == 1 || section == 2{
                return 5
            }
            return 0
        }else if collectionView == self.collectionView2{
            return 0
        }else if collectionView == self.collectionView3{
            return 0
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView1{
            if indexPath.section == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBCivilizationCollectionViewCell", for: indexPath) as! LBCivilizationCollectionViewCell
                cell.backgroundColor = UIColor.white
                var img = ""
                let ary = self.dataArray["index0"] as! NSArray
                let dic = ary[indexPath.row] as! NSDictionary
                if let imgStr = dic["img"] as? String{
                    img = imgStr
                }
                cell.headIcon.image = UIImage.init(named: img)
                cell.titleLab.text = dic["name"] as? String
                return cell
            }else if indexPath.section == 1{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBCivilization1CollectionViewCell", for: indexPath) as! LBCivilization1CollectionViewCell
                cell.backgroundColor = UIColor.white
                var img = ""
                let ary = self.dataArray["index1"] as! NSArray
                let dic = ary[indexPath.row] as! NSDictionary
                if let imgStr = dic["img"] as? String{
                    img = imgStr
                }
                cell.SignUpBtn.layer.cornerRadius = 15
                cell.headIcon.image = UIImage.init(named: img)
                cell.headIcon.layer.masksToBounds = true
                cell.headIcon.layer.cornerRadius = 3
                cell.headIcon.contentMode = .scaleAspectFill
                cell.nameLab.text = dic["name"] as? String
                cell.contentLab.text = dic["content"] as? String
                cell.TimeLab.text = dic["time"] as? String
                return cell
            }else if indexPath.section == 2{
                if self.currentBtn == 0{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBCivilization2CollectionViewCell", for: indexPath) as! LBHomeBottomCollectionViewCell
                    cell.backgroundColor = UIColor.white
                    let ary = self.dataArray["index2"] as! NSArray
                    let dic = ary[indexPath.row] as! NSDictionary
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
                }else if self.currentBtn == 1{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBCivilization4CollectionViewCell", for: indexPath) as! LBCivilization4CollectionViewCell
                    cell.backgroundColor = UIColor.white
                    let ary = self.dataArray["index3"] as! NSArray
                    let dic = ary[indexPath.row] as! NSDictionary
                    var imgStr = ""
                    if let img = dic["img"] as? String{
                        imgStr = img
                    }
                    cell.leftIcon.sd_setImage(with: URL.init(string: imgStr), placeholderImage: UIImage.init(named: imgStr), options: .continueInBackground, completed: nil)
                    cell.leftIcon.contentMode = .scaleAspectFill
                    cell.leftIcon.layer.cornerRadius = 25
                    cell.leftIcon.layer.masksToBounds = true
                    
                    cell.nameLab.text = dic["name"] as? String
                    cell.contentLab.text = dic["content"] as? String
                    cell.likeBtn.isSelected = true
                    var coun = 0
                    if let likeCoun = dic["count"] as? Int{
                        coun = likeCoun
                    }
                    cell.likeBtn.setTitle(String.init(format: "%d",coun ), for: .normal)
                    return cell
                }
            }
        }else if collectionView == self.collectionView2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBCivilizationCollectionViewCell", for: indexPath) as! LBCivilizationCollectionViewCell
            cell.backgroundColor = UIColor.white
            var img = ""
            let ary = self.dataArray2[indexPath.section] as! NSArray
            let dic = ary[indexPath.row] as! NSDictionary
            if let imgStr = dic["img"] as? String{
                img = imgStr
            }
            cell.headIcon.image = UIImage.init(named: img)
            cell.headIcon.contentMode = .scaleAspectFill
            cell.titleLab.text = dic["name"] as? String
            return cell
        }else if collectionView3 == collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBCivilization3CollectionViewCell", for: indexPath) as! LBCivilization3CollectionViewCell
            cell.backgroundColor = UIColor.white
            let dic = self.dataArray3[indexPath.row] as! NSDictionary
            var img = ""
            if let imgStr = dic["img"] as? String{
                img = imgStr
            }
            cell.statusBtn.isSelected = false
            cell.statusBtn.backgroundColor = UIColor.white
            cell.statusBtn.layer.cornerRadius = 5
            cell.statusBtn.layer.borderWidth = 1.5
            cell.statusBtn.layer.borderColor = UIColor.init(hue: 115/255.0, saturation: 175/255.0, brightness: 204/255.0, alpha: 1).cgColor
            cell.statusBtn.setTitleColor(UIColor.init(hue: 115/255.0, saturation: 175/255.0, brightness: 204/255.0, alpha: 1), for: .normal)
            cell.statusBtn.setTitleColor(UIColor.init(hue: 122/255.0, saturation: 181/255.0, brightness: 119/255.0, alpha: 1), for: .selected)
            if let statu = dic["status"] as? String{
                if statu == "Y"{
                    cell.statusBtn.isSelected = true
                    cell.statusBtn.layer.borderColor = UIColor.init(hue: 122/255.0, saturation: 181/255.0, brightness: 119/255.0, alpha: 1).cgColor
                }
            }
            cell.leftLabel.text = dic["categor"] as? String
            cell.nameLab.text = dic["name"] as? String
            cell.contentLab.text = dic["content"] as? String
            cell.timeLab.text = dic["time"] as? String
            cell.leftIcon.image = UIImage.init(named: img)
            cell.bgView.layer.borderColor = UIColor.init(hexString: "D3D3D3", alpha: 1.0)?.cgColor
            cell.bgView.layer.cornerRadius = 2
            cell.bgView.layer.borderWidth = 1
            return cell
        }
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == self.collectionView1{
            var reuseableView : UICollectionReusableView!
            if kind == UICollectionElementKindSectionHeader {
                let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "PeedHeadView", for: indexPath)
                for vi in headView.subviews{
                    vi.removeFromSuperview()
                }
                
                if indexPath.section == 2{
                    
                    let img = UIImageView(frame: CGRect(x: 15, y: 9, width: 16, height: 22))
                    img.image = UIImage.init(named: "热点")
                    headView.addSubview(img)
                    
                    headView.addSubview(self.infomationBtn)
                    headView.addSubview(self.activityBtn)
                }
                reuseableView = headView
            }
            return reuseableView
        }else if collectionView == self.collectionView2{
            var reuseableView : UICollectionReusableView!
            if kind == UICollectionElementKindSectionHeader {
                let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "PeedHeadView1", for: indexPath)
                headView.backgroundColor = LXSize.bgViewColor()
                for vi in headView.subviews{
                    vi.removeFromSuperview()
                }
                
                let vi = UIView(frame: CGRect(x: 10, y: 10, width: 4, height: 20))
                headView.addSubview(vi)
                
                let lab = UILabel.init(frame: CGRect(x: vi.right + 8, y: 0, width: ScreenSize_Width - vi.right - 18, height: 40))
                lab.textColor = LXSize.fontColor()
                lab.font = UIFont.init(name: "PingFangSC-Medium", size: 15)
                headView.addSubview(lab)
                
                //这里数据先写死
                if indexPath.section == 0{
                    vi.backgroundColor = UIColor.init(hexString: "7cba59")
                    lab.text = "健康医疗"
                }else if indexPath.section == 1{
                    vi.backgroundColor = UIColor.init(hexString: "f84e3d")
                    lab.text = "文化教育"
                }else if indexPath.section == 2{
                    vi.backgroundColor = UIColor.init(hexString: "26a7e2")
                    lab.text = "新江宁人网上之家"
                }
                
                reuseableView = headView
            }
            return reuseableView
        }else if collectionView == collectionView3{
            var reuseableView : UICollectionReusableView!
            if kind == UICollectionElementKindSectionHeader {
                let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "PeedHeadView3", for: indexPath)
                for vi in headView.subviews{
                    vi.removeFromSuperview()
                }
                if indexPath.section == 0{
                    
                    headView.addSubview(line)
                    headView.addSubview(self.page3HeadView)
                }
                reuseableView = headView
            }
            return reuseableView
        }
        return UICollectionReusableView.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        if collectionView == self.collectionView1{
            if section == 2{
                return CGSize(width:  ScreenSize_Width, height: 40)
            }
        }else if collectionView == self.collectionView2{
            return CGSize(width:  ScreenSize_Width, height: 40)
        }else if collectionView == self.collectionView3{
            return CGSize(width:  ScreenSize_Width, height: 40)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView1{
            if indexPath.section == 0{
                let vc = LBInformationListViewController()
                let ary = self.dataArray["index0"] as! NSArray
                let dic = ary[indexPath.row] as! NSDictionary
                if let name = dic["name"] as? String{
                    vc.setLBTitle(str: name)
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexPath.section == 2{
                if self.currentBtn == 0{
                    let ary = self.dataArray["index2"] as! NSArray
                    let dic = ary[indexPath.row] as! NSDictionary
                    if dic["url"] != nil{
                        let webview = TOWebViewController.init(urlString: dic["url"] as! String)
                        webview.navigationButtonsHidden = true
                        webview.showUrlWhileLoading = false
                        webview.loadingBarTintColor = LXSize.baseColor()
                        webview.webTitle = dic["name"] as! String
                        webview.buttonTintColor = LXSize.baseColor()
                        self.navigationController?.pushViewController(webview, animated: true)
                    }
                }else if self.currentBtn == 1{
                    let ary = self.dataArray["index3"] as! NSArray
                    let dic = ary[indexPath.row] as! NSDictionary
                    if dic["url"] != nil{
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
        }else if collectionView == self.collectionView2{
            if indexPath.section == 0{
                if indexPath.row == 0{
                    let vc = LBMapLocationViewController()
                    vc.showLocAry = [ ["name":"南京同仁医院","description":"中国江苏省南京市江宁区吉印大道2007号","lat":31.8963966402,"lng":118.8269662857],
                                      ["name":"秣陵社区卫生服务中心","description":"南京市江宁区秣陵街道秣龙路","lat":31.8330800000,"lng":118.8466200000],
                                      ["name":"百家湖社区卫生服务中心","description":"中国江苏省南京市江宁区吉印大道2007号","lat":31.9082800000,"lng":118.8388200000],
                                      ["name":"南京江宁医院","description":"中国江苏省南京市江宁区鼓山路169号","lat":31.9507120000,"lng":118.8491390000],
                    ]
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    let vc = LBInformationListViewController()
                    let ary = dataArray2[indexPath.section] as! NSArray
                    let dic = ary[indexPath.row] as! NSDictionary
                    if let name = dic["name"] as? String{
                        vc.setLBTitle(str: name)
                    }
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }else{
                let vc = LBInformationListViewController()
                let ary = dataArray2[indexPath.section] as! NSArray
                let dic = ary[indexPath.row] as! NSDictionary
                if let name = dic["name"] as? String{
                    vc.setLBTitle(str: name)
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    //scrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.bgScroll{
            self.titleBottomLine.left = (scrollView.contentOffset.x * ((ScreenSize_Width - 30)/3 * CGFloat(self.titleAry.count))) / (ScreenSize_Width * CGFloat(titleAry.count))
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.bgScroll{
            for i in self.titleScroll.subviews{
                if i is UIButton{
                    let btn = i as! UIButton
                    btn.isSelected = false
                    if btn.tag == Int(scrollView.contentOffset.x/ScreenSize_Width + 100){
                        btn.isSelected = true
                        
                        let window = UIApplication.shared.delegate?.window
                        let rect = btn.convert(btn.bounds, to: window!)
                        print(rect)
                        
                        //根据当前按钮距离屏幕位置 调整标题scrollView contentOffSet
                        let currentCont = self.titleScroll.contentOffset.x
                        if rect.origin.x < 0{
                            self.titleScroll.setContentOffset(CGPoint(x: currentCont - (ScreenSize_Width - 30)/3, y: 0), animated: true)
                        }else if (rect.origin.x + rect.width) > (ScreenSize_Width - 15){
                            self.titleScroll.setContentOffset(CGPoint(x: currentCont + (ScreenSize_Width - 30)/3, y: 0), animated: true)
                        }
                        
                    }
                }
            }
        }
    }
}
