//
//  AddTaskViewController.swift
//  TT_iOS
//
//  Created by 이호찬 on 25/11/2018.
//  Copyright © 2018 mash_up_tt. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UITextViewDelegate {
    
    // - MARK: IBOutlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDayTextField: UITextField!
    @IBOutlet weak var taskContentTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    
    // - MARK: Properties
    
    var taskData: TaskModel?
    var toDoListCellData = ["+할일추가"]
    
    // - MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.taskDayTextField.delegate = self
        self.taskNameTextField.delegate = self
        self.taskContentTextView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

  
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.endEditing(true)
    }
    
    // - MARK: TableView DataSource Method

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AddToDoCell = tableView.dequeueReusableCell(withIdentifier: "addToDoCell", for: indexPath) as? AddToDoCell else {
            return UITableViewCell()
        }
        
        cell.toDoLabel.text = toDoListCellData[indexPath.row]
        
        return cell
    }
    
    
    // - MARK: TableView Delegate Method

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == toDoListCellData.count - 1 {
            
        } else {
            
        }
    }
    
    // - MARK: IBActions
    
    @IBAction func addBtn(_ sender: UIButton) {
        self.taskData = TaskModel(taskName: taskNameTextField.text ?? "", taskDay: taskDayTextField.text ?? "", taskContent: taskContentTextView.text ?? "" , toDoList: [""])
    }
    
    @IBAction func dismissBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
