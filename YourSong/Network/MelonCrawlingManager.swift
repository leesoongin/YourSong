//
//  MelonCrawlingManager.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/04.
//

import UIKit
import SwiftSoup
import Alamofire

/*
 추천곡 페이지: https://www.melon.com/genre/recmconts_list.htm?gnrCode=GN0100&tabType=DJ
 */

/*
 썸네일 이미지: #djPlylstList > div > ul > li:nth-child(5) > div.thumb > a > img
 앨범이름: #djPlylstList > div > ul > li:nth-child(5) > div.entry > div.info > a.ellipsis.album_name
 좋아요수: #djPlylstList > div > ul > li:nth-child(5) > div.entry > div.meta > span
 총 수록곡: #djPlylstList > div > ul > li:nth-child(5) > div.entry > div.meta > span
 해시태그: #djPlylstList > div > ul > li:nth-child(5) > div.entry > div.tag_list > a:nth-child(1) > span
 */

/*
4 index: https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=493537910
7 index: https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=497666712
17 index: https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=101470463
19 index: https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=494283599
 */

class MelonCrawlingManager {
    static let shared = MelonCrawlingManager()
    
    private init() {}
    
    func requestRecommandAlbums(){
        let url = "https://www.melon.com/genre/recmconts_list.htm?gnrCode=GN0100&tabType=DJ"
        var thumbnailImage: String = ""
        var album: String = ""
        var likeCount: String = ""
        var musicCount: String = ""
        var hashTag: [String] = []
        var recommandAlbums = [RecommandAlbum]()
        
        AF.request(url).responseString { (response) in
            guard var html = response.value else { return }
            
            if let data = response.data {
                let encodedHtml = NSString(data: data, encoding: CFStringConvertEncodingToNSStringEncoding( 0x0422 ) )
                if let encodedHtml = encodedHtml {
                    html = encodedHtml as String
                }
            }
            
            do {
                let doc: Document = try SwiftSoup.parse(html)
                
                let testElements: Elements = try doc.select("#djPlylstList > div > ul > li")
                for (index, element) in testElements.enumerated() {
                    hashTag = []
                    if (index == 4 || index == 7 || index == 17 || index == 19){
                        thumbnailImage = try element.select("div.thumb > a > img").attr("src").description
                        album = try element.select("div.entry > div.info > a.ellipsis.album_name").text()
                        likeCount = try element.select("div.entry > div.meta > span").text() // 작사가
                        musicCount = try element.select("div.entry > div.meta > span").text() // 발매일
                        for tag in try element.select("div.entry > div.tag_list > a"){
                            hashTag.append(try tag.select("span").text())
                        }
                        recommandAlbums.append(RecommandAlbum(
                                                thumbnailImageUrl: thumbnailImage,
                                                albumTitle: album,
                                                likeCount: likeCount,
                                                musicCount: musicCount,
                                                hashTag: hashTag))
                    }
                }// for
                
                print(recommandAlbums)
            } catch {
                print("crawl error")
            }// catch
        }// AF
        
    }
}
