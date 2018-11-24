//
//  TodoCell.swift
//  TT_iOS
//
//  Created by 김재희 on 2018. 11. 25..
//  Copyright © 2018년 mash_up_tt. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    
     static let ID = "TodoCell"
    
    @IBOutlet var checkBtn: UIButton!
    @IBOutlet var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
