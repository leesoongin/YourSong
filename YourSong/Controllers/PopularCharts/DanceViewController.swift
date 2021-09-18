//
//  DanceViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/18.
//

import UIKit
import XLPagerTabStrip

class DanceViewController: UIViewController,IndicatorInfoProvider {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        
        print("dance viewdldappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("dance viewdldappear")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "댄스")
    }
  
}
