//
//  CenturyChartManager.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/06.
//

import UIKit

class CenturyChartManager {
    static let shared = CenturyChartManager()
    
    private init() {}
    
    private var centuryChartIn1960: [CenturyChartMusic] = [CenturyChartMusic]()
    private var centuryChartIn1970: [CenturyChartMusic] = [CenturyChartMusic]()
    private var centuryChartIn1980: [CenturyChartMusic] = [CenturyChartMusic]()
    private var centuryChartIn1990: [CenturyChartMusic] = [CenturyChartMusic]()
    private var centuryChartIn2000: [CenturyChartMusic] = [CenturyChartMusic]()
    private var centuryChartIn2010: [CenturyChartMusic] = [CenturyChartMusic]()
    
    //getter
    func getCenturyChartIn1960() -> [CenturyChartMusic] {
        return self.centuryChartIn1960
    }
    func getCenturyChartIn1970() -> [CenturyChartMusic] {
        return self.centuryChartIn1970
    }
    func getCenturyChartIn1980() -> [CenturyChartMusic] {
        return self.centuryChartIn1980
    }
    func getCenturyChartIn1990() -> [CenturyChartMusic] {
        return self.centuryChartIn1990
    }
    func getCenturyChartIn2000() -> [CenturyChartMusic] {
        return self.centuryChartIn2000
    }
    func getCenturyChartIn2010() -> [CenturyChartMusic] {
        return self.centuryChartIn2010
    }
}

