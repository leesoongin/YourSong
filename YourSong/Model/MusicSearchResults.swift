//
//  MusicSearchResults.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/22.
//

import UIKit

struct MusicSearchResults {
    private var pageCount: Int
    private var document: [SearchedMusic]
    
    init(){
        self.pageCount = 0
        self.document = [SearchedMusic]()
    }
    
    init(pageCount: Int, document: [SearchedMusic]){
        self.pageCount = pageCount
        self.document = document
    }
    
    mutating func removeFirstAndLast(){
        self.document.removeFirst()
        self.document.removeLast()
    }
    mutating func addSearchMusic(searchedMusic: SearchedMusic){
        self.document.append(searchedMusic)
    }
    mutating func addResults(results: [SearchedMusic]){
        self.document.append(contentsOf: results)
    }
    
    //getter
    func getPageCount() -> Int{
        return self.pageCount
    }
    func getDocument() -> [SearchedMusic]{
        return self.document
    }
    
    //setter
    mutating func setPageCount(_ pageCount: Int){
        if pageCount > 0{
            self.pageCount = pageCount - 2
        }else{
            self.pageCount = 0
        }
    }
  
}
