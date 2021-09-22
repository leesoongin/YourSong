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
    private var musicSearchResults: MusicSearchResults = MusicSearchResults()
    //getter
    func getCategory() -> Int{
        return category
    }
    func getMusicSearchResults() -> MusicSearchResults{
        return self.musicSearchResults
    }
    
    //setter
    func setCategory(_ selectedScope: Int){
        self.category = selectedScope
    }
    func updateMusicSearchResults(_ results: MusicSearchResults){
        self.musicSearchResults = results
    }
}
