//
//  CenturyDetailViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/06.
//

import UIKit

class CenturyDetailViewController: UIViewController {
    
    private let melonCrawlingManager = MelonCrawlingManager.shared
    var idx: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationController()
        melonCrawlingManager.requestCenturyPage(index: idx) { response in
            print("response --> \(response)")
        }
    }
    
    func setupNavigationController(){
        self.navigationItem.title = "시대별 차트"
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.barTintColor = .white
    }
}
