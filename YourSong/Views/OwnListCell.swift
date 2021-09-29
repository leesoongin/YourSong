//
//  OwnListCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/27.
//

import UIKit
import SnapKit
import Then

class OwnListCell: UICollectionViewCell {
    static let identifier: String = "OwnListCell"
    let musicCountLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    let bottomStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 4
    }
    
    let titleLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = .black
    }
    let createDateLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = #colorLiteral(red: 0.9451435208, green: 0.92419523, blue: 0.9724335074, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func config(ownList: OwnMusicList){
        self.musicCountLabel.text = "총 \(ownList.getItems().count)곡"
        self.titleLabel.text = "\(ownList.getName())"
        self.createDateLabel.text = "2021.09.27"
    }
    
    func setLayout(){
        let margin: CGFloat = 16
        
        self.contentView.addSubview(musicCountLabel)
        self.contentView.addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(titleLabel)
        bottomStackView.addArrangedSubview(createDateLabel)
        
        musicCountLabel.snp.makeConstraints{
            $0.top.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
        }
        
        bottomStackView.snp.makeConstraints{
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.bottom.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
        }
    }
}
