//
//  PopularChartViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import SnapKit
import Then
import XLPagerTabStrip

enum PopularChartIdentifier: String {
    case first = "oneToFifty"
    case second = "fiftyOneToOneHundred"
}

class PopularChartViewController: ButtonBarPagerTabStripViewController {
    

    override func viewDidLoad() {
        setButtonBarAttribute() // viewDidLoad 보다 반드시 먼저
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setNavigationItem()
    }
    
    func setNavigationItem(){
        self.navigationItem.title = "이번주 노래방 인기차트"
        self.navigationItem.hidesSearchBarWhenScrolling = true //스크롤할때 searchbar 안숨기기
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let total = TotalViewController()
        let ballade = BalladeViewController()
        let dance = DanceViewController()
        let hiphop = HiphopViewController()
        
        return [total,ballade,dance,hiphop]
    }
    
    func setButtonBarAttribute(){
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarHeight = 58
        settings.style.selectedBarBackgroundColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1.0)
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarItemTitleColor = .black
        settings.style.selectedBarHeight = 3.0
    }
}

