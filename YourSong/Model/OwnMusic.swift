//
//  Music.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import RealmSwift

// 전체적으로 쓰일 음악의 정보들 여기다 쓰자 일단 나중
class OwnMusic: Object {
    @objc dynamic private var number: String?
    @objc dynamic private var title: String?
    @objc dynamic private var artist: String?
    @objc dynamic private var composer: String? // 작곡가
    @objc dynamic private var lyricist: String? // 작사가
    @objc dynamic private var releaseDate: String?
    @objc dynamic private var genre: String?
    @objc dynamic private var gender: String?
    @objc dynamic private var tone: String?
    @objc dynamic private var beat: String?
    @objc dynamic private var memo: String?
    let ofMusicList = LinkingObjects(fromType: OwnMusicList.self, property: "items")
 
    convenience init(number: String, title: String, artist: String, composer: String, lyricist: String, releaseDate: String, genre: String){
        self.init()
        self.number = number
        self.title = title
        self.artist = artist
        self.composer = composer
        self.lyricist = lyricist
        self.releaseDate = releaseDate
        self.genre = genre
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
 
    func setNumber(_ number: String){
        self.number = number
    }
    func setTitle(_ title: String){
        self.title = title
    }
    func setArtist(_ artist: String){
        self.artist = artist
    }
    func setComposer(_ composer: String){
        self.composer = composer
    }
    func setLyricist(_ lyricist: String){
        self.lyricist = lyricist
    }
    func setReleaseDate(_ releaseDate: String){
        self.releaseDate = releaseDate
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
