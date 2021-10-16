//
//  CenturyChartCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/06.
//

import UIKit
import SnapKit
import Then

// 순위 썸네일 타이틀 가수

class CenturyChartCell: UICollectionViewCell {
    static let identifier: String = "CenturyChartCell"
    let bgImageView = UIImageView().then{
        $0.image = UIImage(named: "CenturyChartCellBG")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
    }
    let bgView = UIView().then{
        $0.backgroundColor = .black
        $0.alpha = 0.1
    }
   
    let titleLabel = UILabel().then{
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 4
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = .white
    }
   
    override init(frame : CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = #colorLiteral(red: 0.9451435208, green: 0.92419523, blue: 0.9724335074, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10

        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func config(idx: Int){
        switch idx {
        case 0:
            self.titleLabel.text = "1960년대"
        case 1:
            self.titleLabel.text = "1970년대"
        case 2:
            self.titleLabel.text = "1980년대"
        case 3:
            self.titleLabel.text = "1990년대"
        case 4:
            self.titleLabel.text = "2000년대"
        case 5:
            self.titleLabel.text = "2010년대"
        default:
            print("config error")
        }
    }
    
    func setupLayout(){
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(bgView)
        self.contentView.addSubview(titleLabel)
        
        bgImageView.snp.makeConstraints{
            $0.edges.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        bgView.snp.makeConstraints{
            $0.edges.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerY.centerX.equalTo(self.contentView.safeAreaLayoutGuide)
            
        }
    }
}
