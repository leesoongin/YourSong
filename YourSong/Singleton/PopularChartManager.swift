//
//  PopularChartManager.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/19.
//

import UIKit

class PopularChartManager {
    static let shared = PopularChartManager()
    
    private init() { }
    
    private var totalPopularCharts: [PopularChartMusic] = [PopularChartMusic]() // 전체 인기차트
    private var balladePopularCharts: [PopularChartMusic] = [PopularChartMusic]() // 발라드 인기차트
    private var dancePopularCharts: [PopularChartMusic] = [PopularChartMusic]() // 댄스 인기차트
    private var hiphopPopularCharts: [PopularChartMusic] = [PopularChartMusic]() // 힙합 인기차트
    
    //getter
    func getTotalPopularCharts() -> [PopularChartMusic] {
        return self.totalPopularCharts
    }
    func getBalladePopularCharts() -> [PopularChartMusic] {
        return self.balladePopularCharts
    }
    func getDancePopularCharts() -> [PopularChartMusic] {
        return self.dancePopularCharts
    }
    func getHiphopPopularCharts() -> [PopularChartMusic] {
        return self.hiphopPopularCharts
    }
    
    //extend
    func extendPopularCharts(charts: [PopularChartMusic]){
        self.totalPopularCharts.append(contentsOf: charts)
    }
    func extendBalladeCharts(charts: [PopularChartMusic]){
        self.balladePopularCharts.append(contentsOf: charts)
    }
    func extendDanceCharts(charts: [PopularChartMusic]){
        self.dancePopularCharts.append(contentsOf: charts)
    }
    func extendHiphopCharts(charts: [PopularChartMusic]){
        self.hiphopPopularCharts.append(contentsOf: charts)
    }
}
