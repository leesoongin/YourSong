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
        todayMusicViewController.tabBarItem.title = "추천"
//        todayMusicViewController.tabBarItem.image = UIImage(named: "")
        
        
        let popularChartViewController = PopularChartViewController()
        popularChartViewController.tabBarItem.title = "인기차트"
        
        let musicSearchViewController = UINavigationController(rootViewController: MusicSearchViewController())
        musicSearchViewController.view.backgroundColor = .darkGray
        musicSearchViewController.tabBarItem.title = "음악검색"
        
        let ownMusicListViewController = OwnMusicListViewController()
        ownMusicListViewController.view.backgroundColor = .green
        ownMusicListViewController.tabBarItem.title = "나만의 리스트"
        
        
        viewControllers = [todayMusicViewController,
                           popularChartViewController,
                           musicSearchViewController,
                           ownMusicListViewController]
    }
    

}

