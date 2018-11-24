//
//  ViewController.swift
//  TT_iOS
//
//  Created by byungtak on 24/11/2018.
//  Copyright © 2018 mash_up_tt. All rights reserved.
//

import UIKit

class WeeklyTaskViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    private var weeklys: [Weekly] = []
    private let cellIdentifier = "weekly_task_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dummy
        weeklys.append(Weekly(date: "11/25", day: "월"))
        weeklys.append(Weekly(date: " ", day: "화"))
        weeklys.append(Weekly(date: " ", day: "수"))
        weeklys.append(Weekly(date: " ", day: "목"))
        weeklys.append(Weekly(date: " ", day: "금"))
        weeklys.append(Weekly(date: " ", day: "토"))
        
        initialzeView()
    }

    private func initialzeView() {
        
    }
}

extension WeeklyTaskViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeklys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: WeeklyTaskCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? WeeklyTaskCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        cell.date.text = weeklys[indexPath.item].date
        cell.day.text = weeklys[indexPath.item].day
        
        return cell
    }
    
    
}

extension WeeklyTaskViewController: UICollectionViewDelegate {
    
}
