//
//  LBReleaseViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/8.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBReleaseViewController: LBBaseViewController {

    let titleTf = UITextField()
    
    lazy var textField = UITextView()
    
    lazy var lengthNum = UILabel()
    
    let commitbtn = UIButton(type: .custom)
    
    let selectImgBtn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        self.title = "发 布"
        titleTf.backgroundColor = UIColor.white
        titleTf.frame = CGRect(x: 0, y: 4, width: ScreenSize_Width, height: 40)
        titleTf.placeholder = "请输入标题"
        titleTf.autocorrectionType = .no
        titleTf.leftViewMode = .always
        titleTf.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        titleTf.autocapitalizationType = .none
        titleTf.clearButtonMode = .whileEditing
        titleTf.textColor = UIColor.darkGray
        titleTf.font = UIFont.init(name: "PingFangSC-Regular", size: 14)
        self.view.addSubview(titleTf)
        
        let lab = UILabel()
        lab.frame = CGRect(x: 15, y: 44, width: 200, height: 30 * LXSize.SCREEN_RATE())
        lab.text = "描述一下您的问题~"
        lab.textColor = UIColor.gray
        lab.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(lab)
        
        let textBG = UIView.lineView(frame: CGRect(x: 0, y: lab.bottomY + 3, width: LXSize.ScreenSize_Width(), height: 240 * LXSize.SCREEN_RATE()))
        textField.frame = CGRect(x: 15, y: 15, width: LXSize.ScreenSize_Width() - 30, height: 240 * LXSize.SCREEN_RATE() - 30 )
        textField.delegate = self
        textField.font = UIFont(name: "FZLTXHJW--GB1-0", size: 13 * LXSize.SCREEN_RATE())
        textField.textColor = UIColor.darkGray
        textBG.addSubview(textField)
        self.view.addSubview(textBG)
        
        lengthNum.frame = CGRect(x: LXSize.ScreenSize_Width() - 100, y: 220 * LXSize.SCREEN_RATE(), width: 80, height: 20)
        lengthNum.textColor = UIColor.lightGray
        lengthNum.font = UIFont.systemFont(ofSize: 10)
        lengthNum.text = "0/1000"
        lengthNum.textAlignment = .right
        textBG.addSubview(lengthNum)
        
        commitbtn.frame = CGRect(x: 0, y: 0, width: 60, height: 20)
        commitbtn.setTitle("提交", for: .normal)
        commitbtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        commitbtn.setTitleColor(UIColor.gray, for: .normal)
        commitbtn.addTarget(self, action: #selector(adviceCommitAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: commitbtn)
        
        selectImgBtn.frame = CGRect(x: 15, y: textBG.bottom + 20, width: 70, height: 70)
        selectImgBtn.setBackgroundImage(UIImage.init(named: "添加图片"), for: .normal)
        selectImgBtn.addTarget(self, action: #selector(selectImgBtnAction(btn:)), for: .touchUpInside)
        self.view.addSubview(selectImgBtn)
    }

    @objc func selectImgBtnAction(btn:UIButton){
        let imagePickerVc = TZImagePickerController.init(maxImagesCount: 1, delegate: self)
        imagePickerVc?.allowPickingVideo = false
        imagePickerVc?.allowCrop = true
        imagePickerVc?.cropRect = CGRect(x: 0, y: (LXSize.ScreenSize_Height() - LXSize.ScreenSize_Width())/2.0, width: LXSize.ScreenSize_Width(), height: LXSize.ScreenSize_Width())
        self.present(imagePickerVc!, animated: true, completion: nil)
    }
    
    @objc private func adviceCommitAction(){
        print( "神挡杀神多无" + self.textField.text)
        
        print( "神挡杀神多无" + self.textField.text)
        if self.textField.text ?? "" == ""{
            _ = LBHUDView.init(inView: self.view, HUDType: "Text", text: "请输入内容", animation: true, Color: false)
            return
        }
        
        if self.titleTf.text ?? "" == ""{
            _ = LBHUDView.init(inView: self.view, HUDType: "Text", text: "请输入标题", animation: true, Color: false)
            return
        }
        
        _ = LBHUDView.init(inView: self.view, HUDType: "SUCCESS", text: "提交成功,感谢您的反馈", animation: true, Color: false)
        self.perform(#selector(lbback), with: self, afterDelay: 1.5)
    }
    
    @objc func lbback(){
        _ = self.navigationController?.popViewController(animated: true)
    }
}
extension LBReleaseViewController:UITextViewDelegate,TZImagePickerControllerDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let length = self.textField.text.characters.count
        lengthNum.text = "\(length)/1000"
        
        if length > 0{
            commitbtn.setTitleColor(LXSize.baseColor(), for: .normal)
        }else{
            commitbtn.setTitleColor(UIColor.gray, for: .normal)
        }
        
        if length >= 1000{
            let index = self.textField.text.index(self.textField.text.startIndex, offsetBy: 1000)
            self.textField.text = self.textField.text.substring(to: index)
            lengthNum.text = "\(1000)/1000"
        }
    }
    
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool, infos: [[AnyHashable : Any]]!) {
        if photos.count > 0 {
            selectImgBtn.setBackgroundImage(photos[0], for: .normal)
            
//            self.SwiftUploadImage(image: photos[0], uid: uid as! String)
            
        }
    }
}
