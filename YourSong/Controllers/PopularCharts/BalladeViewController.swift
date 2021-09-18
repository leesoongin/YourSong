//
//  BalladeViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/18.
//

import UIKit
import XLPagerTabStrip

class BalladeViewController: UIViewController,IndicatorInfoProvider {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        print("ballade viewdidload")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("ballade viewdldappear")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "발라드")
    }
}
