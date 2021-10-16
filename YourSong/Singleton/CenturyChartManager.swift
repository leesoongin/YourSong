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
    func getCenturyChart(index: Int) -> [CenturyChartMusic] {
        switch index {
        case 0:
            return self.centuryChartIn1960
        case 1:
            return self.centuryChartIn1970
        case 2:
            return self.centuryChartIn1980
        case 3:
            return self.centuryChartIn1990
        case 4:
            return self.centuryChartIn2000
        case 5:
            return self.centuryChartIn2010
        default:
            return []
        }
    }
   
    
    //setter
    func extendCenturyChart(index: Int, _ chart: [CenturyChartMusic]){
        switch index {
        case 0:
            self.centuryChartIn1960.append(contentsOf: chart)
        case 1:
            self.centuryChartIn1970.append(contentsOf: chart)
        case 2:
            self.centuryChartIn1980.append(contentsOf: chart)
        case 3:
            self.centuryChartIn1990.append(contentsOf: chart)
        case 4:
            self.centuryChartIn2000.append(contentsOf: chart)
        case 5:
            self.centuryChartIn2010.append(contentsOf: chart)
        default:
            print("centuryChartManager extend error.")
        }
    }
   
}

