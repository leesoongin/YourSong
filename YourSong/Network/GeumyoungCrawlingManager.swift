//
//  GeumyoungCrawlingManager.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import SwiftSoup
import Alamofire

/* 인기차트 Selector 들
 인기차트 순위 -> #popular_chart_frm > div > ul:nth-child(5) > li.popular_chart_chk > label > span.popular_chart_link
 순위 변동 -> #popular_chart_frm > div > ul:nth-child(4) > li.popular_chart_chk > label > span.popular_chart_down > img
 곡번호 -> #popular_chart_frm > div > ul:nth-child(7) > li.popular_chart_num
 곡 제목 -> #popular_chart_frm > div > ul:nth-child(7) > li.popular_chart_tit.clear > span:nth-child(1)
 작곡가 -> #popular_chart_frm > div > ul:nth-child(2) > li.popular_chart_cmp
 작사가 -> #popular_chart_frm > div > ul:nth-child(2) > li.popular_chart_wrt
 발매일 -> #popular_chart_frm > div > ul:nth-child(2) > li.popular_chart_rel
 */

/* 음악검색 Selector 들
 MARK: - 제목으로 검색 -> 2 / 가수명으로 검색 -> 7
 곡번호 -> #search_chart_frm_2 > div > ul:nth-child(2) > li.search_chart_num
 곡 제목 -> #search_chart_frm_2 > div > ul:nth-child(2) > li.search_chart_tit.clear > span:nth-child(1)
 아티스트 -> #search_chart_frm_2 > div > ul:nth-child(2) > li.search_chart_sng
 작곡가 -> #search_chart_frm_2 > div > ul:nth-child(2) > li.search_chart_cmp
 작사가 -> #search_chart_frm_2 > div > ul:nth-child(2) > li.search_chart_wrt
 발매일 -> #search_chart_frm_2 > div > ul:nth-child(2) > li.search_chart_rel
 

 
 페이지 수 -> #post-2130 > div > div > div > div > section.elementor-section.elementor-top-section.elementor-element.elementor-element-76df765.elementor-section-boxed.elementor-section-height-default.elementor-section-height-default > div > div > div > div > div > div > div > div > div > div > div > div > div.search_chart_page_nav > a:nth-child(2)


 
 https://kysing.kr/search/?category=2&keyword=%EC%8B%A0%ED%98%B8%EB%93%B1
 https://kysing.kr/search/?keyword=%EC%8B%A0%ED%98%B8%EB%93%B1
 */

 /*
 1. 발라드 인기곡 1페이지  ->  https://kysing.kr/genre-polular/?genre=01
 2. 2페이지 -> https://kysing.kr/genre-polular/?genre=01&range=2
 //
 1. 댄스 인기곡 1페이지 -> https://kysing.kr/genre-polular/?genre=02
 2. 2페이지 -> https://kysing.kr/genre-polular/?genre=02&range=2
 //
 1. 힙합 인기곡 1페이지 -> https://kysing.kr/genre-polular/?genre=04
 2. 2페이지 -> https://kysing.kr/genre-polular/?genre=04&range=2
 */




enum PopularChartAddresses {
    static let totalChartsFirst = "https://kysing.kr/popular/?period=" // 전체 인기차트 순위
    static let totalChartsSecond = "https://kysing.kr/popular/?period=&range=2"
    static let balladeChartsFirst = "https://kysing.kr/genre-polular/?genre=01" // 발라드 인기차트 순위
    static let balladeChartsSecond = "https://kysing.kr/genre-polular/?genre=01&range=2"
    static let danceChartsFirst = "https://kysing.kr/genre-polular/?genre=02" // 댄스 인기차트 순위
    static let danceChartsSecond = "https://kysing.kr/genre-polular/?genre=02&range=2"
    static let hiphopChartsFirst = "https://kysing.kr/genre-polular/?genre=04" // 힙합 인기차트 순위
    static let hiphopChartsSecond = "https://kysing.kr/genre-polular/?genre=04&range=2"
}

enum MusicSearchAddresses {
    static let titleSearch = "https://kysing.kr/search/?category=2&keyword="
    static let artistSearch = "https://kysing.kr/search/?category=7&keyword="
}
//https://kysing.kr/search/?category=7&keyword=%EC%9C%A4%EB%94%B4%EB%94%B4&s_page=2
class GeumyoungCrawlingManager {
    static let shared = GeumyoungCrawlingManager()
    
    private init() { }
    
    func loadPopularChart(identifier: String, completion: @escaping ([PopularChartMusic])->(Void)){
        var url: String = ""
    
        url = getPopularChartUrl(identifier: identifier)
        requestPopularChart(url: url){ response in
            completion(response)
        }
    }
    
    func loadSearchedMusic(category: Int, keyword: String, completion: @escaping (MusicSearchResults)->(Void)){
        var url: String = ""
        
        url = getSearchUrl(category: category, keyword: keyword)
       
        requestMusicSearchResult(category: category, url: url){ response in
            completion(response)
        }
    }
    
    func loadNextPageOfSearchedMusic(category: Int, keyword: String, page: Int, completion: @escaping (MusicSearchResults)->(Void)){
        var url: String = ""
        
        // 여기서 url 만들어오고,
        url = getNextPageUrl(url: getSearchUrl(category: category, keyword: keyword), page: page)
        
        requestMusicSearchResult(category: category, url: url){ response in
            completion(response)
        }
        
    }
    
    private func requestMusicSearchResult(category: Int, url: String, completion: @escaping (MusicSearchResults)->(Void)){
        var number: String = ""
        var title: String = ""
        var artist: String = ""
        var composer: String = ""
        var lyricist: String = ""
        var releaseDate: String = ""
        var musicSearchedResults = MusicSearchResults(pageCount: 0, document: [])
        var elements: Elements = Elements()
        
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
                if category == 0 {
                    elements = try doc.select("#search_chart_frm_2 > div > ul")
                }
                else {
                    elements = try doc.select("#search_chart_frm_7 > div > ul")
                }
                
                let pageCountElements: Elements = try doc.select("#post-2130 > div > div > div > div > section.elementor-section.elementor-top-section.elementor-element.elementor-element-76df765.elementor-section-boxed.elementor-section-height-default.elementor-section-height-default > div > div > div > div > div > div > div > div > div > div > div > div > div.search_chart_page_nav > a")
                for element in elements {
                    number = try element.select("li.search_chart_num").text() // 곡번호
                    composer = try element.select("li.search_chart_cmp").text() // 작곡가
                    lyricist = try element.select("li.search_chart_wrt").text() // 작사가
                    releaseDate = try element.select("li.search_chart_rel").text() // 발매일
                    for ele in try element.select("li.search_chart_tit.clear"){
                        title = try ele.select("span")[0].text() // 제목
                        artist = try ele.select("span")[1].text() // 가수
                    }// inner for
                    
                    musicSearchedResults.addSearchMusic(searchedMusic: PopularChartMusic(rank: "", rankUp: "", rankDown: "", number: number, title: title, artist: artist, composer: composer, lyricist: lyricist, releaseDate: releaseDate))
                }// for
                musicSearchedResults.setPageCount(pageCountElements.count)
                
                if musicSearchedResults.getDocument().count != 0 { // 검색 결과 없다면 안해도됨
                    musicSearchedResults.removeFirstAndLast()
                }
                
                completion(musicSearchedResults)
            } catch {
                print("crawl error")
            }// catch
        }// AF
    }
    
    private func requestPopularChart(url: String, completion: @escaping ([PopularChartMusic])->(Void)){
        var rank: String?
        var rankUp: String?
        var rankDown: String?
        var number: String?
        var title: String?
        var artist: String?
        var composer: String?
        var lyricist: String?
        var releaseDate: String?
        var popularChart: [PopularChartMusic] = [PopularChartMusic]()
        
        print("서치 url --> \(url)")
        
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
                    composer = try element.select("li.popular_chart_cmp").text() // 작곡가
                    lyricist = try element.select("li.popular_chart_wrt").text() // 작사가
                    releaseDate = try element.select("li.popular_chart_rel").text() // 발매일
                    
                    for ele in try element.select("li.popular_chart_tit.clear"){
                        title = try ele.select("span")[0].text() // 제목
                        artist = try ele.select("span")[1].text() // 가수
                    }
                    popularChart.append(PopularChartMusic(rank: rank, rankUp: rankUp, rankDown: rankDown, number: number, title: title, artist: artist, composer: composer, lyricist: lyricist, releaseDate: releaseDate))
                }
                
                popularChart.removeFirst() // 맨 앞 요소는 표 정보라서 제외 ㅇㅇ
                popularChart.removeLast()
                completion(popularChart)
            } catch {
                print("crawl error")
            }// catch
        }// AF
    }
    
    private func getPopularChartUrl(identifier: String) -> String {
        var url: String = ""
        
        switch identifier{
        case "totalChartsFirst":
            url = PopularChartAddresses.totalChartsFirst
        case "totalChartsSecond":
            url = PopularChartAddresses.totalChartsSecond
        case "balladeChartsFirst":
            url = PopularChartAddresses.balladeChartsFirst
        case "balladeChartsSecond":
            url = PopularChartAddresses.balladeChartsSecond
        case "danceChartsFirst":
            url = PopularChartAddresses.danceChartsFirst
        case "danceChartsSecond":
            url = PopularChartAddresses.danceChartsSecond
        case "hiphopChartsFirst":
            url = PopularChartAddresses.hiphopChartsFirst
        case "hiphopChartsSecond":
            url = PopularChartAddresses.hiphopChartsSecond
        default:
            print("잘못된 입력")
        }
        return url
    }
    
    private func getSearchUrl(category: Int, keyword: String) -> String {
        var url: String = ""
        
        switch category {
        case 0:
            url = MusicSearchAddresses.titleSearch
        case 1:
            url = MusicSearchAddresses.artistSearch
        default:
            print("getSearchUrl 잘못된 입력")
        }
        let urlString = "\(url)\(keyword)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        return encodedString
    }
    
    private func getNextPageUrl(url: String, page: Int) -> String{
        return "\(url)&s_page=\(page)"
    }
}
