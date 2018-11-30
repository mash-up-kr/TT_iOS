//
//  AddTaskViewController.swift
//  TT_iOS
//
//  Created by 이호찬 on 25/11/2018.
//  Copyright © 2018 mash_up_tt. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    // - MARK: IBOutlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDayTextField: UITextField!
    @IBOutlet weak var taskContentTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    
    // - MARK: Properties
    
    var taskData: TaskModel?
    var toDoList = ["⚪️ ppt 준비"]
    
    // - MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.taskDayTextField.delegate = self
        self.taskNameTextField.delegate = self
        self.taskContentTextView.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)

        
        // Do any additional setup after loading the view.
    }
    
    
    // - MARK: IBActions
    
    @IBAction func addBtn(_ sender: UIButton) {
        self.taskData = TaskModel(taskName: taskNameTextField.text ?? "", taskDay: taskDayTextField.text ?? "", taskContent: taskContentTextView.text ?? "" , toDoList: toDoList)
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


extension AddTaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    // TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == toDoList.count {
            guard let cell: AddTaskToDoCell = tableView.dequeueReusableCell(withIdentifier: "addTaskToDoCell", for: indexPath) as? AddTaskToDoCell else {
                return UITableViewCell()
            }
            
            return cell
            
        } else {
            guard let cell: AddToDoCell = tableView.dequeueReusableCell(withIdentifier: "addToDoCell", for: indexPath) as? AddToDoCell else {
                return UITableViewCell()
            }
            cell.taskTextField.text = toDoList[indexPath.row]
            cell.indexPath = indexPath
            cell.delegate = self
            return cell
        }
        
    }
    
    
    // TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == toDoList.count {
            toDoList.append("⚪️ ")
            tableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .none)
        }
    }
    
}

extension AddTaskViewController: UITextFieldDelegate, TextFieldChangeDelegate {
    
    
    // UITextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    // TextFieldChange Delegate
    
    func deleteCell(at indexPath: IndexPath) {
        toDoList.remove(at: indexPath.row)
        tableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .none)
    }
    
    func textChanged(at indexPath: IndexPath, text changedText: String) {
        toDoList[indexPath.row] = changedText
    }
    
}

extension AddTaskViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.endEditing(true)
    }
    
}
