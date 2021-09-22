//
//  SearchedMusic.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/22.
//


import UIKit

struct SearchedMusic {
    private let number: String
    private let title: String
    private let artist: String
    private let composer: String // 작곡가
    private let lyricist: String // 작사가
    private let releaseDate: String // 발매일
    
    init(number: String, title: String, artist: String, composer: String, lyricist: String, releaseDate: String){
        self.number = number
        self.title = title
        self.artist = artist
        self.composer = composer
        self.lyricist = lyricist
        self.releaseDate = releaseDate
    }
    
    // getter
    func getNumber() -> String{
        return self.number
    }
    func getTitle() -> String{
        return self.title
    }
    func getArtist() -> String{
        return self.artist
    }
    func getComposer() -> String{
        return self.composer
    }
    func getLyricist() -> String{
        return self.lyricist
    }
    func getReleaseDate() -> String{
        return self.releaseDate
    }
}

