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

/* 추천 앨범 모음
 썸네일 이미지: #djPlylstList > div > ul > li:nth-child(5) > div.thumb > a > img
 앨범이름: #djPlylstList > div > ul > li:nth-child(5) > div.entry > div.info > a.ellipsis.album_name
 총 수록곡: #djPlylstList > div > ul > li:nth-child(5) > div.entry > div.meta > span
 해시태그: #djPlylstList > div > ul > li:nth-child(5) > div.entry > div.tag_list > a:nth-child(1) > span
 */


/* 앨범 수록곡
 순위: #frm > div > table > tbody > tr:nth-child(1) > td:nth-child(2) > div > span.rank
 썸네일 이미지: #frm > div > table > tbody > tr:nth-child(1) > td:nth-child(3) > div > a > img
 타이틀: #frm > div > table > tbody > tr:nth-child(1) > td:nth-child(5) > div > div > div.ellipsis.rank01 > span > a
 가수: #frm > div > table > tbody > tr:nth-child(1) > td:nth-child(5) > div > div > div.ellipsis.rank02 > a
 */


enum TodayRecommandPages {
    static let firstPage = "https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=493537910"
    static let secondPage = "https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=497666712"
    static let thirdPage = "https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=101470463"
    static let fourthPage = "https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq=494283599"
}

class MelonCrawlingManager {
    static let shared = MelonCrawlingManager()
    
    private init() {}
    
    func requestMusicFromAlbum(index: Int, completion: @escaping (([RecommandMusic])->(Void))){
        let currentUrl = getRecommandPage(index: index)
        var imageUrl = ""
        var title = ""
        var artist = ""
        var rank = ""
        var recommandMusic = [RecommandMusic]()
        
        AF.request(currentUrl).responseString { (response) in
            guard var html = response.value else { return }
            
            if let data = response.data {
                let encodedHtml = NSString(data: data, encoding: CFStringConvertEncodingToNSStringEncoding( 0x0422 ) )
                if let encodedHtml = encodedHtml {
                    html = encodedHtml as String
                }
            }
            
            do {
                let doc: Document = try SwiftSoup.parse(html)
                
                let recommandElements: Elements = try doc.select("#frm > div > table > tbody > tr")
                for element in recommandElements {
                    rank = try element.select("td")[1].select("div > span.rank").text()
                    imageUrl = try element.select("td")[2].select("div > a > img").attr("src").description
                    title = try element.select("td")[4].select("div > div > div.ellipsis.rank01 > span > a").text()
                    artist = try element.select("td")[4].select("div > div > div.ellipsis.rank02 > a").text()
                    
                    recommandMusic.append(RecommandMusic(thumbnailUrl: imageUrl,
                                                         title: title,
                                                         artist: artist,
                                                         rank: rank))
                }// for
                completion(recommandMusic)
            } catch {
                print("crawl error")
            }// catch
        }// AF
    }
    
    func requestRecommandAlbums(completion: @escaping (([RecommandAlbum])->(Void))){
        let url = "https://www.melon.com/genre/recmconts_list.htm?gnrCode=GN0100&tabType=DJ"
        var thumbnailImage: String = ""
        var album: String = ""
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
                
                let elements: Elements = try doc.select("#djPlylstList > div > ul > li")
                for (index, element) in elements.enumerated() {
                    hashTag = []
                    if (index == 4 || index == 7 || index == 17 || index == 19){
                        thumbnailImage = try element.select("div.thumb > a > img").attr("src").description
                        album = try element.select("div.entry > div.info > a.ellipsis.album_name").text()
                        musicCount = try element.select("div.entry > div.meta > span").text() // 발매일
                        for tag in try element.select("div.entry > div.tag_list > a"){
                            hashTag.append(try tag.select("span").text())
                        }
                        recommandAlbums.append(RecommandAlbum(
                                                thumbnailImageUrl: thumbnailImage,
                                                albumTitle: album,
                                                musicCount: musicCount,
                                                hashTag: hashTag))
                    }
                }// for
                completion(recommandAlbums)
            } catch {
                print("crawl error")
            }// catch
        }// AF
    }
    
    private func getRecommandPage(index: Int) -> String{
        switch index {
        case 0:
            return TodayRecommandPages.firstPage
        case 1:
            return TodayRecommandPages.secondPage
        case 2:
            return TodayRecommandPages.thirdPage
        case 3:
            return TodayRecommandPages.fourthPage
        default:
            return ""
        }
    }
}
