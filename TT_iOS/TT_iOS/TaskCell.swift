//
//  TaskCell.swift
//  TT_iOS
//
//  Created by 김재희 on 2018. 11. 25..
//  Copyright © 2018년 mash_up_tt. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var subjectColorView: UIView!
    @IBOutlet var deadlineLabel: UILabel!
    @IBOutlet var taskNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
