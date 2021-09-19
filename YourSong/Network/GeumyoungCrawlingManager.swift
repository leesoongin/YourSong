//
//  GeumyoungCrawlingManager.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import SwiftSoup
import Alamofire

/* 사용할 Selector 들
 인기차트 순위 -> #popular_chart_frm > div > ul:nth-child(5) > li.popular_chart_chk > label > span.popular_chart_link
 순위 변동 -> #popular_chart_frm > div > ul:nth-child(4) > li.popular_chart_chk > label > span.popular_chart_down > img
 곡번호 -> #popular_chart_frm > div > ul:nth-child(7) > li.popular_chart_num
 곡 제목 -> #popular_chart_frm > div > ul:nth-child(7) > li.popular_chart_tit.clear > span:nth-child(1)
 */

enum AddressCollection {
    static let  oneToFiftyURL = "https://kysing.kr/popular/?period=w"
    static let  fiftyOneToOneHundredURL = "https://kysing.kr/popular/?period=w&range=2"
}

class GeumyoungCrawlingManager {
    static let shared = GeumyoungCrawlingManager()
    
    private init() { }
    
    func loadPopularChart(identifier: String, completion: @escaping ([PopularChartMusic])->(Void)){
        var url: String = ""
        var rank: String?
        var rankUp: String?
        var rankDown: String?
        var number: String?
        var title: String?
        var artist: String?
        var popularChart: [PopularChartMusic] = [PopularChartMusic]()
        
        if identifier == "oneToFifty" {
            url = AddressCollection.oneToFiftyURL
        }else if identifier == "fiftyOneToOneHundred"{
            url = AddressCollection.fiftyOneToOneHundredURL
        }
        
        
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
                // 곡 제목
                let singTitles: Elements = try doc.select("#popular_chart_frm > div > ul")
                for element in singTitles {
                    rank = try element.select("li.popular_chart_chk > label > span.popular_chart_link").text() // 순위
                    rankUp = try element.select("li.popular_chart_chk > label > span.popular_chart_up").text() // 순위 업
                    rankDown = try element.select("li.popular_chart_chk > label > span.popular_chart_down").text() // 순위 다운
                    number = try element.select("li.popular_chart_num").text() // 곡 번호
                    
                    for ele in try element.select("li.popular_chart_tit.clear"){
                        title = try ele.select("span")[0].text() // 제목
                        artist = try ele.select("span")[1].text() // 가수
                    }
                    
                    popularChart.append(PopularChartMusic(rank: rank, rankUp: rankUp, rankDown: rankDown, number: number, title: title, artist: artist))
                }
                popularChart.removeFirst() // 맨 앞 요소는 표 정보라서 제외 ㅇㅇ
                completion(popularChart)
            } catch {
                print("crawl error")
            }// catch
        }// AF
    }// one To fifty
    
    
}
