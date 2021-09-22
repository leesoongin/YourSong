//
//  MusicSearchViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import Then
import SnapKit

class MusicSearchViewController: UIViewController {
    private lazy var searchController = UISearchController().then{
        $0.searchBar.delegate = self
        $0.obscuresBackgroundDuringPresentation = false // 뒤에 안이쁘니까 지우자 ㅋㅋ
        $0.searchBar.scopeButtonTitles = ["제목검색","가수검색"]
        $0.searchBar.placeholder = "검색"
        //        searchController.searchBar.showsScopeBar = true // scopebar 항상 나오기
        //        searchController.hidesNavigationBarDuringPresentation = false // searchbar쓸때 네비게이션 타이틀 안숨기기
    }
    
    private let musicSearchManager = MusicSearchManager.shared
    private let crawlingManager = GeumyoungCrawlingManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setNavigationItem()
    }
    
    func setNavigationItem(){
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "음악 검색"
        self.navigationItem.hidesSearchBarWhenScrolling = true //스크롤할때 searchbar 안숨기기
    }
}

extension MusicSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // 1. TODO: 여기서 검색 카테고리 설정하자
        musicSearchManager.setCategory(selectedScope)
    }
    //return 키 눌렀을때 delegate 메서드를 알아오면 좋을듯
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 1 TODO: Search Request 는 여기서 하자.
        print("들어옴 일단")
        
        let category = musicSearchManager.getCategory() // 현재 선택되어 있는 카테고리  - Default 는 0
        guard let keyword = searchBar.text else {
            print("searchBar text is nil")
            return
        }
        
        crawlingManager.loadSearchedMusic(category: category, keyword: keyword) { response in
            print("musicSearch response --> \(response)")
        }
    }
}
