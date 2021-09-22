//
//  MusicSearchManager.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/21.
//

import UIKit

class MusicSearchManager {
    static let shared = MusicSearchManager()
    
    private init() { }
    
    private var category: Int = 0 // 검색 카테고리 - 통합, 제목, 가수
    private var currentSearchTerm: String = ""
    private var currentPage: Int = 1 // 현재 페이지
    private var musicSearchResults: MusicSearchResults = MusicSearchResults()
    //getter
    func getCategory() -> Int{
        return category
    }
    func getCurrentSearchTerm() -> String {
        return self.currentSearchTerm
    }
    func getCurrentPage() -> Int{
        return self.currentPage
    }
    func getMusicSearchResults() -> MusicSearchResults{
        return self.musicSearchResults
    }
    
    
    
    //setter
    func setCategory(_ selectedScope: Int){
        self.category = selectedScope
    }
    func updateCurrentSearchTerm(_ searchTerm: String){
        self.currentSearchTerm = searchTerm
    }
    func updateMusicSearchResults(_ results: MusicSearchResults){
        self.musicSearchResults = results
    }
    func turnThePage(){
        self.currentPage += 1
    }
    func resetCurrentPage(){
        self.currentPage = 1
    }
    func addMusicSearchResults(_ results: MusicSearchResults){
        self.musicSearchResults.addResults(results: results.getDocument())
    }
}
