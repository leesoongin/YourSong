//
//  ViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.blue
        tabBar.unselectedItemTintColor = UIColor.black
        
        setUpTabBar()
        
    }
    
    private func setUpTabBar(){
        let todayMusicViewController = TodayMusicViewController()
        todayMusicViewController.tabBarItem.image = UIImage(named: "recommentIcon")
        todayMusicViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 16, left: 0, bottom: -16, right: 0)
        
        
        let popularChartViewController = UIStoryboard.init(name: "PopularChart", bundle: nil).instantiateViewController(withIdentifier: "PopularCharts") as! PopularChartViewController
        let popularChartViewControllerInNavigation = UINavigationController(rootViewController: popularChartViewController)
        popularChartViewController.tabBarItem.image = UIImage(named: "popularChartIcon")
        popularChartViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 16, left: 0, bottom: -16, right: 0)
        
        
        let musicSearchViewController = UINavigationController(rootViewController: MusicSearchViewController())
        musicSearchViewController.tabBarItem.image = UIImage(named: "searchIcon")
        musicSearchViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 16, left: 0, bottom: -16, right: 0)
        
        let ownMusicListViewController = UINavigationController(rootViewController: OwnMusicListViewController())
        ownMusicListViewController.tabBarItem.image = UIImage(named: "ownListIcon")
        ownMusicListViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 16, left: 0, bottom: -16, right: 0)
        
        
        viewControllers = [todayMusicViewController,
                           popularChartViewControllerInNavigation,
                           musicSearchViewController,
                           ownMusicListViewController]
    }
    

}

