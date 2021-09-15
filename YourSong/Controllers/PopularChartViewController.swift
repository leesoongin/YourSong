//
//  PopularChartViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import SnapKit
import Then

enum PopularChartIdentifier: String {
    case first = "oneToFifty"
    case second = "fiftyOneToOneHundred"
}

class PopularChartViewController: UIViewController {
    
    let buttonOne = UIButton().then{
        $0.setTitle("1~50위", for: .normal)
        $0.layer.cornerRadius = 5.0
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.systemGray, for: .highlighted)
        $0.backgroundColor = .black
        $0.addTarget(self, action: #selector(requestPopularChartFirst(_:)), for: .touchUpInside)
    }
    
    let buttonTwo = UIButton().then{
        $0.setTitle("51~100위", for: .normal)
        $0.layer.cornerRadius = 5.0
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.systemGray, for: .highlighted)
        $0.backgroundColor = .black
        $0.addTarget(self, action: #selector(requestPopularChartSecond(_:)), for: .touchUpInside)
    }
    
    // singleton
    private let geumyoungCrawlingManager = GeumyoungCrawlingManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    @objc func requestPopularChartFirst(_ sender: UIButton){
        geumyoungCrawlingManager.loadPopularChart(identifier: PopularChartIdentifier.first.rawValue)
    }
    @objc func requestPopularChartSecond(_ sender: UIButton){
        geumyoungCrawlingManager.loadPopularChart(identifier: PopularChartIdentifier.second.rawValue)
    }
}

extension PopularChartViewController {
    func setUI(){
        self.view.addSubview(buttonOne)
        self.view.addSubview(buttonTwo)
    }
    
    func setLayout(){
        buttonOne.snp.makeConstraints{
            $0.top.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        buttonTwo.snp.makeConstraints{
            $0.top.equalTo(self.buttonOne.snp.bottom).offset(30)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

