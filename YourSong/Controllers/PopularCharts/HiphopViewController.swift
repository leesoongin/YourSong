//
//  HiphopViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/18.
//

import UIKit
import XLPagerTabStrip

class HiphopViewController: UIViewController,IndicatorInfoProvider {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        print("hiphop viewdidload")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("hiphop viewdldappear")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "힙합")
    }
}
