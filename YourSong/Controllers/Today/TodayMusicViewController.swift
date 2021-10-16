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
    func moveToTodayDetailView(index: Int)
    func moveToCenturyDetailView(index: Int)
}

class TodayMusicViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then{
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        let todayRecommandView = TodayRecommandView(frame: .zero).then{
            $0.delegate = self
        }
        let centuryChartView = CenturyChartView(frame: .zero).then{
            $0.delegate = self
        }
        
        $0.addArrangedSubview(todayRecommandView)
        $0.addArrangedSubview(centuryChartView)
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
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func setupLayout(){
        let margin: CGFloat = 16.0
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(margin * 2)
            $0.leading.trailing.bottom.equalToSuperview()
        }

    }
}

extension TodayMusicViewController: TodayMusicDelegate {
    func moveToTodayDetailView(index: Int) {
        let todayRecommandDetailVC = TodayRecommandDetailViewController()
        todayRecommandDetailVC.idx = index
        
        self.navigationController?.pushViewController(todayRecommandDetailVC, animated: true)
    }
    
    func moveToCenturyDetailView(index: Int) {
        let centuryDetailVC = CenturyDetailViewController()
        centuryDetailVC.idx = index
        
        self.navigationController?.pushViewController(centuryDetailVC, animated: true)
    }
}
