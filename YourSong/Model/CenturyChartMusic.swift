//
//  CenturyChartMusic.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/06.
//

import UIKit

struct CenturyChartMusic {
    private var rank: String
    private var thumbnailImageUrl: String
    private var title: String
    private var artist: String
    
    init(rank: String, thumbnailImageUrl: String, title: String, artist: String){
        self.rank = rank
        self.thumbnailImageUrl = thumbnailImageUrl
        self.title = title
        self.artist = artist
    }
    
    //getter
    func getRank() -> String {
        return self.rank
    }
    func getThumbnailImageUrl() -> String {
        return self.thumbnailImageUrl
    }
    func getTitle() -> String {
        return self.title
    }
    func getArtist() -> String {
        return self.artist
    }
}

