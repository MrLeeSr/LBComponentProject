//
//  LBReleaseHistoryViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/8.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBReleaseHistoryViewController: LBBaseViewController {

    var collectionView3:UICollectionView?
    
    var dataArray3 = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let ary3 = [["categor":"建议","status":"Y","name":"建议公交公司增加临时扫墓直达车","content":"建议:公交公司在清明期间增加义乌商品城一","time":"2018-04-02","img":"p1"],
                    ["categor":"曝光","status":"Y","name":"踏青变\"踏\"青","content":"随着天气转暖,每天到家附近的公园锻炼身体","time":"2018-03-22","img":"p2"],
                    ["categor":"曝光","status":"N","name":"\"接孩子大军\"频现不文明","content":"接近放学时间,上元大街的实验小学门前,到","time":"2018-03-20","img":"lbCivilizationp3"],
                    ["categor":"曝光","status":"N","name":"翻越护栏横穿马路不文明行为","content":"上元大街,金箔路等城区道路换上了崭新的交","time":"2018-03-18","img":"p2"],
                    ["categor":"建议","status":"Y","name":"建议公交公司增加临时扫墓直达车","content":"建议:公交公司在清明期间增加义乌商品城一","time":"2018-04-02","img":"lbCivilizationp3"],
                    ["categor":"曝光","status":"N","name":"\"接孩子大军\"频现不文明","content":"接近放学时间,上元大街的实验小学门前,到","time":"2018-03-20","img":"p1"],
                    ]
        self.dataArray3 = NSArray(array: ary3)
        self.collectionView3?.reloadData()
    }
    
    func setUpUI(){
        self.title = "历史发布"
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView3 = UICollectionView(frame: CGRect(x:0, y: 0,width: ScreenSize_Width, height:ScreenSize_Height - StatusBar_Height - 44),collectionViewLayout:flowLayout);
        collectionView3?.backgroundColor = UIColor.white
        collectionView3?.delegate = self;
        collectionView3?.dataSource = self;
        collectionView3?.autoresizingMask = .flexibleHeight
        // 在注册cell 的同时，别忘了注册header
        collectionView3?.register(UINib(nibName: "LBCivilization3CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBCivilization3CollectionViewCell")
        
        self.view.addSubview(collectionView3!)
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
extension LBReleaseHistoryViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //collectionDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray3.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  ScreenSize_Width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
