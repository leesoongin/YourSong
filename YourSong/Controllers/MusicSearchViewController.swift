//
//  MusicSearchViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import Then
import SnapKit
import NVActivityIndicatorView

class MusicSearchViewController: UIViewController {
    private lazy var searchController = UISearchController().then{
        $0.searchBar.delegate = self
        $0.obscuresBackgroundDuringPresentation = false // 뒤에 안이쁘니까 지우자 ㅋㅋ
        $0.searchBar.scopeButtonTitles = ["제목검색","가수검색"]
        $0.searchBar.placeholder = "검색"
        //        searchController.searchBar.showsScopeBar = true // scopebar 항상 나오기
        //        searchController.hidesNavigationBarDuringPresentation = false // searchbar쓸때 네비게이션 타이틀 안숨기기
    }
    let tableView = UITableView(frame: .zero, style: .plain).then{
        $0.register(SearchChartCell.self,forCellReuseIdentifier: SearchChartCell.identifier)
        $0.rowHeight = 54
        $0.estimatedRowHeight = 150
        $0.showsVerticalScrollIndicator = false
    }
    var indicator: NVActivityIndicatorView?
    
    private let musicSearchManager = MusicSearchManager.shared
    private let crawlingManager = GeumyoungCrawlingManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        setNavigationItem()
        config()
        setUI()
        setLayout()
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
    
    func setNavigationItem(){
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "음악 검색"
        self.navigationItem.hidesSearchBarWhenScrolling = true //스크롤할때 searchbar 안숨기기
    }
}

extension MusicSearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicSearchManager.getMusicSearchResults().getDocument().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchChartCell.identifier) as? SearchChartCell else {
            return UITableViewCell()
        }
        let number = self.musicSearchManager.getMusicSearchResults().getDocument()[indexPath.row].getNumber()
        let title = self.musicSearchManager.getMusicSearchResults().getDocument()[indexPath.row].getTitle()
        let artist = self.musicSearchManager.getMusicSearchResults().getDocument()[indexPath.row].getArtist()

        cell.setBind(number: number, title: title, artist: artist)
        
        return cell
    }
    
    
}

extension MusicSearchViewController: UITableViewDelegate {
    
}

extension MusicSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // 1. TODO: 여기서 검색 카테고리 설정하자
        musicSearchManager.setCategory(selectedScope)
    }
    
    // Search Request
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let indicator = self.indicator else { return }
        indicator.startAnimating()
        
        let category = musicSearchManager.getCategory() // 현재 선택되어 있는 카테고리  - Default 는 0
        guard let keyword = searchBar.text else {
            print("searchBar text is nil")
            return
        }
        
        crawlingManager.loadSearchedMusic(category: category, keyword: keyword) { response in
            self.musicSearchManager.updateMusicSearchResults(response)
            indicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
}
