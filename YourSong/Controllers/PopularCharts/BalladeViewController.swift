//
//  BalladeViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/18.
//

import UIKit
import XLPagerTabStrip
import Then
import SnapKit
import NVActivityIndicatorView


class BalladeViewController: UIViewController,IndicatorInfoProvider,PopularChartDelegate {
    // UI
    let tableView = UITableView(frame: .zero, style: .plain).then{
        $0.register(PopularChartCell.self,forCellReuseIdentifier: PopularChartCell.identifier)
        $0.rowHeight = 54
        $0.estimatedRowHeight = 150
        $0.showsVerticalScrollIndicator = false
    }
    var indicator: NVActivityIndicatorView?
    
    // popularChartDelegate
    let crawlingManager: GeumyoungCrawlingManager = GeumyoungCrawlingManager.shared
    let chartManager: PopularChartManager = PopularChartManager.shared
    var firstPage: String = "balladeChartsFirst"
    var secondPage: String = "balladeChartsSecond"
    var callCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
        setUI()
        setLayout()
        loadCharts(identifier: firstPage) //인기차트 첫번째 페이지 불러오기
        
        print("ballade viewdidload")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("ballade viewdldappear")
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "발라드")
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
            self.chartManager.extendBalladeCharts(charts: response)
            indicator.stopAnimating()
            self.tableView.reloadData()
        }
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

extension BalladeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chartManager.getBalladePopularCharts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularChartCell.identifier) as? PopularChartCell else{
            return UITableViewCell()
        }
        
        cell.setBind(musicData: self.chartManager.getBalladePopularCharts()[indexPath.row])
        cell.popularChartCellDelegate = self
        
        return cell
    }
}

extension BalladeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = PopularMusicDetailViewController()
        detailVC.selectedMusic = self.chartManager.getBalladePopularCharts()[indexPath.row]
        
        detailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension BalladeViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height

        // 스크롤이  collectionView Offset의 끝에 가게 되면 다음 페이지를 호출
        if offsetY > (contentHeight - height) {
            callCount += 1
            if self.chartManager.getBalladePopularCharts().count < 98 && callCount == 1{
                loadCharts(identifier: secondPage)
            }
        }
    }
}

extension BalladeViewController: PopularChartCellDelegate {
    func moveToDetail(musicData: PopularChartMusic) {
        checkAlert(musicData: musicData)
    }
}
