//
//  LBBBSTableViewCell.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/5.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBBBSTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ImgBGHeigh: NSLayoutConstraint!
    @IBOutlet weak var headIcon: UIImageView!
    
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var contentLab: UILabel!
    @IBOutlet weak var imgBG: UIView!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var collecBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setImgAry(ary:NSArray){
        
        for vi in self.imgBG.subviews{
            vi.removeFromSuperview()
        }
        
        var inde = 0
        let heigh:CGFloat = (ScreenSize_Width - 34)/3.0
        if inde == ary.count{
            self.ImgBGHeigh.constant = 1
        }
        for strEle in ary{
            let imgStr = strEle as! String
            let imgView = UIImageView.init(frame: CGRect(x: (CGFloat(inde % 3) * (4 + heigh)), y: CGFloat(inde / 3) * (heigh + 6), width: heigh, height: heigh))
            imgView.image = UIImage.init(named: imgStr)
            imgView.contentMode = .scaleAspectFill
            self.imgBG.addSubview(imgView)
            
            inde = inde + 1
            if inde == ary.count{
                self.ImgBGHeigh.constant = imgView.bottom
            }
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
