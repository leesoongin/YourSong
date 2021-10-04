//
//  TodayRecommandCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/04.
//

import UIKit
import SnapKit
import Then


class TodayRecommandCell: UICollectionViewCell {
    static let identifier: String = "TodayRecommandCollectionViewCell"
    let bgImageView = UIImageView().then{
        $0.image = UIImage(named: "ownListBackground3")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
    }
    let bgView = UIView().then{
        $0.backgroundColor = .black
        $0.alpha = 0.3
    }
    
    let numberLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    let titleLabel: UILabel = UILabel().then{
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 4
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textColor = .white
    }
    let artistLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    let topStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 8.0
    }
    
    let memoTextView = UITextView().then{
        $0.layer.cornerRadius = 5
        $0.text = "asddd"
        $0.backgroundColor = .clear
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
        $0.isEditable = false
    }

    
    override init(frame : CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = #colorLiteral(red: 0.9451435208, green: 0.92419523, blue: 0.9724335074, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10

        setupLayout()
        config()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func config(){
        self.numberLabel.text = "📖  KY 1234567"
        self.titleLabel.text = "밝게 빛나는 별이 되어 줄게 (Cover. 류민희)"
        self.artistLabel.text = "류민희 "
        self.memoTextView.text = "✏️\n\n언제나 널 지켜줄게 세상이 널 아프게 할때~~ 내가 안아줄게 매일"
    }
    
    private func setupLayout(){
        let margin: CGFloat = 16.0
        
        self.contentView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        self.contentView.addSubview(bgView)
        bgView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        self.contentView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints{
            $0.top.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
        }
        
        self.contentView.addSubview(topStackView)
        topStackView.snp.makeConstraints{
            $0.top.equalTo(numberLabel.snp.bottom).offset(margin)
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
        }
        
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(artistLabel)
        
        self.contentView.addSubview(memoTextView)
        memoTextView.snp.makeConstraints{
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.bottom.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
            $0.height.equalTo(150)
        }
    }
}
