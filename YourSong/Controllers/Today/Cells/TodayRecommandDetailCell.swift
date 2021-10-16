//
//  TodayRecommandDetailCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/05.
//

import UIKit
import Kingfisher
import SnapKit
import Then

class TodayRecommandDetailCell: UICollectionViewCell {
    static let identifier: String = "TodayRecommandDetailCell"
    let bgImageView = UIImageView().then{
        $0.image = UIImage(named: "ownListBackground3")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
    }
    let bgView = UIView().then{
        $0.backgroundColor = .black
        $0.alpha = 0.5
    }
    
    let topStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 4.0
    }
   
    let titleLabel = UILabel().then{
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 4
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .white
    }
    let artistLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 12)
        $0.textColor = .white
    }
    let rankLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 12)
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
    
    func config(imageUrl: String, title: String, artist: String, rank: String){
        self.bgImageView.kf.setImage(with: URL(string: imageUrl))
        print("rank \(rank)")
        self.rankLabel.text = "👑  \(rank)위"
        self.titleLabel.text = title
        self.artistLabel.text = artist
    }
    
    func setupLayout(){
        let margin: CGFloat = 16.0
        
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(bgView)
        self.contentView.addSubview(topStackView)
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(artistLabel)
        
        bgImageView.snp.makeConstraints{
            $0.edges.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        bgView.snp.makeConstraints{
            $0.edges.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        topStackView.snp.makeConstraints{
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
            $0.bottom.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin / 2)
        }
    
    }
}
