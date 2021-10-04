//
//  RecommandMusic.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/05.
//

import UIKit

struct RecommandMusic {
    private var thumbnailUrl: String
    private var title: String
    private var artist: String
    private var rank: String
    
    init(thumbnailUrl: String, title: String, artist: String, rank: String){
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.artist = artist
        self.rank = rank
    }
    
    //getter
    func getThumbnailUrl() -> String {
        return self.thumbnailUrl
    }
    func getTitle() -> String {
        return self.title
    }
    func getArtist() -> String {
        return self.artist
    }
    func getRank() -> String {
        return self.rank
    }
    
}
