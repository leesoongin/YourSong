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
import NVActivityIndicatorView

class TotalViewController: UIViewController,IndicatorInfoProvider, PopularChartDelegate {
    // UI
    let tableView = UITableView(frame: .zero, style: .plain).then{
        $0.register(PopularChartCell.self,forCellReuseIdentifier: PopularChartCell.identifier)
        $0.rowHeight = 54
        $0.estimatedRowHeight = 150
        $0.showsVerticalScrollIndicator = false
    }
    var indicator: NVActivityIndicatorView?
    
    // manager
    let crawlingManager: GeumyoungCrawlingManager = GeumyoungCrawlingManager.shared
    let chartManager: PopularChartManager = PopularChartManager.shared
    
    var firstPage: String = "totalChartsFirst"
    var secondPage: String = "totalChartsSecond"
    var callCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setUI()
        setLayout()
        loadCharts(identifier: firstPage) //인기차트 첫번째 페이지 불러오기
        
        print("total viewdidload")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("total viewdldappear")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "전체")
    }
    
    func config(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setUI(){
        indicator = NVActivityIndicatorView(frame: CGRect(x:self.view.frame.size.width/2-25 , y: self.view.frame.size.height/2-80, width: 50, height: 50), type: .circleStrokeSpin, color: .black, padding: 0)
    }
    
    func setLayout(){
        self.view.addSubview(tableView)
        self.view.addSubview(indicator!)
        let tableViewSideMargin: CGFloat = 8
        
        tableView.snp.makeConstraints{
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(tableViewSideMargin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(tableViewSideMargin)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func loadCharts(identifier: String){
        guard let indicator = self.indicator else { return }
        indicator.startAnimating()
        
        crawlingManager.loadPopularChart(identifier: identifier) { response in
            self.chartManager.extendPopularCharts(charts: response)
            indicator.stopAnimating()
            self.tableView.reloadData()
        }
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
       
        cell.setBind(musicData: self.chartManager.getTotalPopularCharts()[indexPath.row])
        cell.popularChartCellDelegate = self
        
        return cell
    }
    
    func checkAlert(musicData: PopularChartMusic){
        let alert = UIAlertController(title: "나만의 리스트", message: "해당 음원을 추가하실건가요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "넹 !", style: .default) { (ok) in
            let firstInputViewController = FirstInputViewController()
            let containerVC = UINavigationController(rootViewController: firstInputViewController)
            
            containerVC.modalPresentationStyle = .fullScreen
            firstInputViewController.selectedMusic = musicData
            
            self.present(containerVC, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "아뇨 !", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension TotalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = PopularMusicDetailViewController()
        detailVC.selectedMusic = self.chartManager.getTotalPopularCharts()[indexPath.row]
        
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension TotalViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        if offsetY > (contentHeight - height) {
            callCount += 1
            if self.chartManager.getTotalPopularCharts().count < 98 && callCount == 1{
                self.loadCharts(identifier: self.secondPage)
            }
        }
    }
}

extension TotalViewController: PopularChartCellDelegate {
    func moveToDetail(musicData: PopularChartMusic) {
        checkAlert(musicData: musicData)
    }
}
