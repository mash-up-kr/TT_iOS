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
        weeklys.append(Weekly(date: "11/25", day: "월", today: true))
        weeklys.append(Weekly(date: " ", day: "화", today: false))
        weeklys.append(Weekly(date: " ", day: "수", today: false))
        weeklys.append(Weekly(date: " ", day: "목", today: false))
        weeklys.append(Weekly(date: " ", day: "금", today: false))
        weeklys.append(Weekly(date: "12/01", day: "토", today: false))
        
        initialzeView()
    }

    private func initialzeView() {
//        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//        flowLayout.sectionInset = UIEdgeInsets.zero
//        flowLayout.minimumInteritemSpacing = 0
//        flowLayout.minimumLineSpacing = 6
//        flowLayout.scrollDirection = .horizontal
//
//        let itemHeight = collectionView.frame.size.height
//        let itemWidth = itemHeight
//
//        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
//
//        collectionView.collectionViewLayout = flowLayout
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
        
        let isToday = weeklys[indexPath.item].today
        
        if isToday == true {
            cell.today.isHidden  = false
        }
        
        return cell
    }
    
    
}

extension WeeklyTaskViewController: UICollectionViewDelegate {
    
}
