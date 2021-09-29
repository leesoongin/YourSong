//
//  PopularChartDelegate.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/19.
//

import UIKit

protocol PopularChartDelegate {
    var crawlingManager: GeumyoungCrawlingManager { get }
    var chartManager: PopularChartManager { get }
    var firstPage: String { get }
    var secondPage: String { get }
}


protocol PopularChartCellDelegate{
    func moveToDetail(musicData: PopularChartMusic)
}
