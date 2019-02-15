//
//  LBInfoDetaiCommentTableViewCell.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/7.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBInfoDetaiCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var leftIcon: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var contentLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
