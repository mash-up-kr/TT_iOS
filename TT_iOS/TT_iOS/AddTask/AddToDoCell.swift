//
//  AddToDoCell.swift
//  TT_iOS
//
//  Created by 이호찬 on 25/11/2018.
//  Copyright © 2018 mash_up_tt. All rights reserved.
//

import UIKit

protocol TextFieldChangeDelegate {
    func deleteCell(at indexPath: IndexPath)
    func textChanged(at indexPath: IndexPath, text changedText: String)
}

protocol TextFieldToCellDelegate {
    func sendEmpty()
}


class AddToDoCell: UITableViewCell {

    @IBOutlet weak var taskTextField: CustomTextField!
    
    var delegate: TextFieldChangeDelegate?
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        taskTextField.delegate = self
        taskTextField.sendDelegate = self
        
        taskTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.textChanged(at: indexPath, text: textField.text ?? "")
    }

}


extension AddToDoCell: UITextFieldDelegate, TextFieldToCellDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    // TextFieldToCellDelegate
    func sendEmpty() {
        self.delegate?.deleteCell(at: indexPath)
    }
    
}




class CustomTextField: UITextField {
    
    var sendDelegate: TextFieldToCellDelegate?
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Methods
    
    override func deleteBackward() {
        super.deleteBackward()
        if self.text?.isEmpty == true {
            print("deleteBackward")
            self.sendDelegate?.sendEmpty()
            
        }
    }
    
}
