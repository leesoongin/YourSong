//
//  Music.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import RealmSwift

// 전체적으로 쓰일 음악의 정보들 여기다 쓰자 일단 나중
class OwnMusic {
    private var musicData: PopularChartMusic
    private var genre: String?
    private var gender: String?
    private var tone: String?
    private var beat: String?
    private var memo: String?
    
    init(musicData: PopularChartMusic, genre: String?, gender: String?, tone: String?, beat: String?, memo: String?){
        self.musicData = musicData
        self.genre = genre
        self.gender = gender
        self.tone = tone
        self.beat = beat
        self.memo = memo
    }
    init (musicData: PopularChartMusic, genre: String){
        self.musicData = musicData
        self.genre = genre
    }
    
    //getter
    func getMusicData() -> PopularChartMusic {
        return self.musicData
    }
    func getGenre() -> String?{
        return self.genre
    }
    func getGender() -> String?{
        return self.gender
    }
    func getTone() -> String?{
        return self.tone
    }
    func getBeat() -> String?{
        return self.beat
    }
    func getMemo() -> String?{
        return self.memo
    }
    
    //setter
    func setMusicData(_ data: PopularChartMusic){
        self.musicData = data
    }
    func setGenre(_ genre: String){
        self.genre = genre
    }
    func setGender(_ gender: String){
        self.gender = gender
    }
    func setTone(_ tone: String){
        self.tone = tone
    }
    func setBeat(_ beat: String){
        self.beat = beat
    }
    func setMemo(_ memo: String){
        self.memo = memo
    }

}
