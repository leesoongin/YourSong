//
//  TodayMusicViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import SnapKit
import Then

protocol TodayMusicDelegate {
    func moveToDetailView(index: Int)
}

class TodayMusicViewController: UIViewController {
   
    lazy var todayRecommandView = TodayRecommandView(frame: .zero).then{
        $0.delegate = self
    }
    
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
        self.view.addSubview(todayRecommandView)
        
        todayRecommandView.snp.makeConstraints{
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

extension TodayMusicViewController: TodayMusicDelegate {
    func moveToDetailView(index: Int) {
        let todayRecommandDetailVC = TodayRecommandDetailViewController()
        todayRecommandDetailVC.idx = index
        
        self.present(todayRecommandDetailVC, animated: true, completion: nil)
    }
}
