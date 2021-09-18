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
    
    private var totalPopularCharts: [PopularChartMusic] = [PopularChartMusic]() // 일단 전체만
    
    func getTotalPopularCharts() -> [PopularChartMusic] {
        return self.totalPopularCharts
    }
    
    func extendPopularCharts(charts: [PopularChartMusic]){
        var arr = charts
        arr.removeLast()
        self.totalPopularCharts.append(contentsOf: arr)
    }
    
}
