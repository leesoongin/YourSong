//
//  RecommandAlbums.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/05.
//

import UIKit

struct RecommandAlbums {
    private var recommandAlbums: [RecommandAlbum]
    
    init(recommandAlbums: [RecommandAlbum]){
        self.recommandAlbums = recommandAlbums
    }
    //getter
    func getRecommandAlbums() -> [RecommandAlbum] {
        return self.recommandAlbums
    }
}

struct RecommandAlbum {
    private var thumbnailImageUrl: String
    private var albumTitle: String
    private var likeCount: String
    private var musicCount: String
    private var hashTag: [String]
    
    init(thumbnailImageUrl: String, albumTitle: String, likeCount: String, musicCount: String, hashTag: [String]){
        self.thumbnailImageUrl = thumbnailImageUrl
        self.albumTitle = albumTitle
        self.likeCount = likeCount
        self.musicCount = musicCount
        self.hashTag = hashTag
    }
    
    //getter
    func getThumbnailImageUrl() -> String{
        return self.thumbnailImageUrl
    }
    func getAlbumTitle() -> String {
        return self.albumTitle
    }
    func getLikeCount() -> String {
        return self.likeCount
    }
    func getMusicCount() -> String {
        return self.musicCount
    }
    func getHashTag() -> [String] {
        return self.hashTag
    }
}
