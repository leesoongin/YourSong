//
//  TodayRecommandHeaderView.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/05.
//

import UIKit
import SnapKit
import Then


class TodayRecommandHeaderView: UICollectionReusableView {
    static let identifier = "TodayRecommandHeaderView"
    let headerLabel = UILabel().then{
        $0.text = "📻 오늘의 플레이리스트"
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    func setupViews(){
        let margin: CGFloat = 16.0
        
        self.addSubview(headerLabel)
        headerLabel.snp.makeConstraints{
            $0.centerY.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview()
        }
    }
}
