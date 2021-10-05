//
//  TodayRecommandCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/04.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class TodayRecommandCell: UICollectionViewCell {
    static let identifier: String = "TodayRecommandCollectionViewCell"
    let bgImageView = UIImageView().then{
        $0.image = UIImage(named: "ownListBackground3")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
    }
    let bgView = UIView().then{
        $0.backgroundColor = .black
        $0.alpha = 0.5
    }
    
    let titleLabel: UILabel = UILabel().then{
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 4
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textColor = .white
    }
    let likeCountLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    let musicCountLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    let topStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 8.0
    }
    let tagButtonOne = UIButton().then{
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .black
    }
    let tagButtonTwo = UIButton().then{
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .black
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
    
    func config(imageUrl: String, title: String, musicCount: String, hashTag: [String]){
        self.bgImageView.kf.setImage(with: URL(string: imageUrl))
        self.titleLabel.text = "🍂\n\(title)"
        self.musicCountLabel.text = "총 \(musicCount)"
    }
    
    private func setupLayout(){
        let margin: CGFloat = 16.0
        
        self.contentView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        self.contentView.addSubview(bgView)
        bgView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
//            $0.height.equalTo(self.contentView.frame.width / 2 - margin)
        }
        
        self.contentView.addSubview(topStackView)
        topStackView.snp.makeConstraints{
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.bottom.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
        }
        
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(musicCountLabel)       
    }
}
