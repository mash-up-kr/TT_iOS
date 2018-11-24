//
//  ViewController.swift
//  TT_iOS
//
//  Created by byungtak on 24/11/2018.
//  Copyright © 2018 mash_up_tt. All rights reserved.
//

import UIKit
import ExpandableCell

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskListView: ExpandableTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskListView.expandableDelegate = self
        taskListView.animation = .automatic
        taskListView.register(UINib(nibName: TaskCell.ID, bundle: nil), forCellReuseIdentifier: TaskCell.ID)
        taskListView.register(UINib(nibName: TodoCell.ID, bundle: nil), forCellReuseIdentifier: TodoCell.ID)
        taskListView.tableFooterView = UIView()
        taskListView.closeAll()
    }
}

extension MainViewController: ExpandableDelegate {
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [44]
    }
    
    func numberOfSections(in expandableTableView: ExpandableTableView) -> Int {
        return 1
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        let todoCell: TodoCell = taskListView.dequeueReusableCell(withIdentifier: TodoCell.ID, for: indexPath) as! TodoCell
        
        todoCell.checkBtn.titleLabel?.text = "⚪️"
        todoCell.todoLabel.text = "주제 정리"
        
        return [todoCell]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let taskCell: TaskCell = taskListView.dequeueReusableCell(withIdentifier: TaskCell.ID, for: indexPath) as? TaskCell else { return UITableViewCell() }
        
        taskCell.progressView.setProgress(0.5, animated: true)
        taskCell.subjectColorView.backgroundColor = .blue
        taskCell.deadlineLabel.text = "D-2"
        taskCell.taskNameLabel.text = "과제1"
        taskCell.dateLabel.text = "마감일 2018. 11. 28"
        
        return taskCell
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        print("didSelectExpandedRowAt:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? TaskCell {
            print("\(cell.taskNameLabel.text ?? "")")
        }
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
