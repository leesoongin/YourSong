//
//  CenturyDetailViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/06.
//

import UIKit

class CenturyDetailViewController: UIViewController {
    lazy var tableView = UITableView(frame: .zero, style: .plain).then{
        $0.rowHeight = 50
        $0.estimatedRowHeight = 150
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.register(CenturyChartDetailCell.self,forCellReuseIdentifier: CenturyChartDetailCell.identifier)
    }
    
    private let melonCrawlingManager = MelonCrawlingManager.shared
    private let centuryChartManager = CenturyChartManager.shared
    
    var idx: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationController()
        setLayout()
        melonCrawlingManager.requestCenturyPage(index: idx) { response in
            self.centuryChartManager.extendCenturyChart(index: self.idx, response)
            self.tableView.reloadData()
        }
    }
    
    func setupNavigationController(){
        self.navigationItem.title = getNavigationTitle()
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func setLayout(){
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func getNavigationTitle() -> String{
        switch self.idx {
        case 0:
            return "1960년대"
        case 1:
            return "1970년대"
        case 2:
            return "1980년대"
        case 3:
            return "1990년대"
        case 4:
            return "2000년대"
        case 5:
            return "2010년대"
        default:
            return ""
        }
    }
}

extension CenturyDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.centuryChartManager.getCenturyChart(index: self.idx).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CenturyChartDetailCell.identifier) as? CenturyChartDetailCell else{
            return UITableViewCell()
        }
       
        cell.config(music: self.centuryChartManager.getCenturyChart(index: self.idx)[indexPath.row])
        
        return cell
    }
}

extension CenturyDetailViewController: UITableViewDelegate {
    
}
