//
//  TotalViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/18.
//

import UIKit
import XLPagerTabStrip
import Then
import SnapKit

class TotalViewController: UIViewController,IndicatorInfoProvider {
    let tableView = UITableView(frame: .zero, style: .plain).then{
        $0.register(PopularChartCell.self,forCellReuseIdentifier: PopularChartCell.identifier)
        $0.rowHeight = 60
        $0.estimatedRowHeight = 150
        $0.showsVerticalScrollIndicator = false
    }
    
    let crawlingManager = GeumyoungCrawlingManager.shared
    let chartManager = PopularChartManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crawlingManager.loadPopularChart(identifier: "oneToFifty") { response in
            self.chartManager.extendPopularCharts(charts: response)
            self.tableView.reloadData()
        }
        
        config()
        setLayout()

        print("total viewdidload")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("total viewdldappear")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "전체")
    }
    
    func setLayout(){
        self.view.addSubview(tableView)
        let tableViewSideMargin: CGFloat = 8
        
        tableView.snp.makeConstraints{
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(tableViewSideMargin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(tableViewSideMargin)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func config(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension TotalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chartManager.getTotalPopularCharts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularChartCell.identifier) as? PopularChartCell else{
            return UITableViewCell()
        }
        let number = self.chartManager.getTotalPopularCharts()[indexPath.row].getNumber()
        let rank = self.chartManager.getTotalPopularCharts()[indexPath.row].getRank()
        let rankUp = self.chartManager.getTotalPopularCharts()[indexPath.row].getRankUp()
        let rankDown = self.chartManager.getTotalPopularCharts()[indexPath.row].getRankDown()
        let title = self.chartManager.getTotalPopularCharts()[indexPath.row].getTitle()
        let artist = self.chartManager.getTotalPopularCharts()[indexPath.row].getArtist()
        
        cell.setBind(number: number, rank: rank, rankUp: rankUp, rankDown: rankDown, title: title, artist: artist)
        
        return cell
    }
}

extension TotalViewController: UITableViewDelegate {
    
}
