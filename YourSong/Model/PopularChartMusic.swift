//
//  PopularChartMusic.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
/*
    순위
    순위 업
    순위 다운
    곡 번호
    제목
    가수
*/

struct PopularChartMusic {
    private let rank: String?
    private let rankUp: String?
    private let rankDown: String?
    private let number: String?
    private let title: String?
    private let artist: String?
    
    init(rank: String?, rankUp: String?, rankDown: String?, number: String?, title: String?, artist: String?){
        self.rank = rank
        self.rankUp = rankUp
        self.rankDown = rankDown
        self.number = number
        self.title = title
        self.artist = artist
    }
    
    // getter
    func getRank() -> String{
        guard let rank = self.rank else {
            print("getRank error")
            return ""
        }
        return rank
    }
    func getRankUp() -> String{
        guard let rankUp = self.rankUp else {
            print("getRankUp error")
            return ""
        }
        return rankUp
    }
    func getRankDown() -> String{
        guard let rankDown = self.rankDown else {
            print("getRankDown error")
            return ""
        }
        return rankDown
    }
    func getNumber() -> String{
        guard let number = self.number else {
            print("getNumber error")
            return ""
        }
        return number
    }
    func getTitle() -> String{
        guard let title = self.title else {
            print("getTitle error")
            return ""
        }
        return title
    }
    func getArtist() -> String{
        guard let artist = self.artist else {
            print("getArtist error")
            return ""
        }
        return artist
    }
}
