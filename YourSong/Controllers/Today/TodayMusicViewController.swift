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
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private lazy var stackView = UIStackView().then{
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        
        let todayRecommandView = TodayRecommandView(frame: .zero)
        $0.addArrangedSubview(todayRecommandView)
    }
    
    private let melonCrawlingManager = MelonCrawlingManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationController()
        setupLayout()
        
        melonCrawlingManager.requestRecommandAlbums()
    }
}

extension TodayMusicViewController {
    func setupNavigationController(){
        self.navigationItem.title = "랜덤 추천곡"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func setupLayout(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    
    }
}
