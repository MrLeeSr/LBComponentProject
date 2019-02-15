//
//  LBVolunteerTableViewCell.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/7.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBVolunteerTableViewCell: UITableViewCell {

    @IBOutlet weak var leftIcon: UIImageView!
    @IBOutlet weak var nameLabe: UILabel!
    @IBOutlet weak var contentLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var needCount: UILabel!
    @IBOutlet weak var hadCount: UILabel!
    @IBOutlet weak var ConfirmBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
