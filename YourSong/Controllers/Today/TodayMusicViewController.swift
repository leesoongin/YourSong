//
//  TodayMusicViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import SnapKit
import Then

class TodayMusicViewController: UIViewController {
   
    let todayRecommandView = TodayRecommandView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationController()
        setupLayout()
    }
}

extension TodayMusicViewController {
    func setupNavigationController(){
        self.navigationItem.title = "오늘의 추천곡"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func setupLayout(){
        let margin: CGFloat = 16.0
        
        self.view.addSubview(todayRecommandView)
        
        todayRecommandView.snp.makeConstraints{
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
