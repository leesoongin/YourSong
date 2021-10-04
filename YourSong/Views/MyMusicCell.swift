//
//  MyMusicCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/29.
//

import UIKit
import SnapKit
import Then

class MyMusicCell: UICollectionViewCell {
    static let identifier: String = "myMusicCell"
    
    let topView = UIView()
    let bgImageView = UIImageView().then{
        $0.image = UIImage(named: "ownListBackground4")
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
    }
    let bgView = UIView().then{
        $0.backgroundColor = .black
        $0.alpha = 0.5
    }
    
    let numberLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    let titleAndArtistStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    let titleLabel: UILabel = UILabel().then{
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 4
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .white
    }
    let artistLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    let bottomView = UIView()
    let bottomStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    let genderStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    let genderImageView = UIImageView().then{
        $0.backgroundColor = .gray
    }
    let genderLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.text = "성별"
        $0.textColor = .white
    }
    
    let toneStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    let toneImageView = UIImageView().then{
        $0.backgroundColor = .gray
    }
    let toneLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.text = "음정"
        $0.textColor = .white
    }
    
    let beatStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    let beatImageView = UIImageView().then{
        $0.backgroundColor = .gray
    }
    let beatLabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.text = "박자"
        $0.textColor = .white
    }
    
    let memoTextView = UITextView().then{
        $0.layer.cornerRadius = 5
        $0.text = "asddd"
        $0.backgroundColor = .clear
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .white
        $0.isEditable = false
//        $0.backgroundColor =  #colorLiteral(red: 0.9451435208, green: 0.92419523, blue: 0.9724335074, alpha: 1)
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = #colorLiteral(red: 0.9451435208, green: 0.92419523, blue: 0.9724335074, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        

        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func config(ownList: OwnMusic){
        
        self.numberLabel.text = "KY \(ownList.getNumber() ?? "")"
        self.titleLabel.text = ownList.getTitle()
        self.artistLabel.text = ownList.getArtist()
        self.genderLabel.text = "👫  성별  \(ownList.getGender() ?? "")"
        self.toneLabel.text = "🎵  음정  \(ownList.getTone() ?? "")"
        self.beatLabel.text = "🥁  박자  \(ownList.getBeat() ?? "")"
        self.memoTextView.text = "✏️\n\n\(ownList.getMemo() ?? "")"
    }
    
    func setLayout(){
        let margin: CGFloat = 16
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(bgView)
        self.contentView.addSubview(topView)
        self.contentView.addSubview(bottomView)
        topView.addSubview(numberLabel)
        topView.addSubview(titleAndArtistStackView)
        titleAndArtistStackView.addArrangedSubview(titleLabel)
        titleAndArtistStackView.addArrangedSubview(artistLabel)
        bottomView.addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(genderStackView)
        bottomStackView.addArrangedSubview(toneStackView)
        bottomStackView.addArrangedSubview(beatStackView)
//        genderStackView.addArrangedSubview(genderImageView)
        genderStackView.addArrangedSubview(genderLabel)
//        toneStackView.addArrangedSubview(toneImageView)
        toneStackView.addArrangedSubview(toneLabel)
//        beatStackView.addArrangedSubview(beatImageView)
        beatStackView.addArrangedSubview(beatLabel)
        bottomView.addSubview(memoTextView)
        
        bgImageView.snp.makeConstraints{
            $0.edges.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        bgView.snp.makeConstraints{
            $0.edges.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        topView.snp.makeConstraints{
            $0.top.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
            $0.height.equalTo(200)
        }
        
        numberLabel.snp.makeConstraints{
            $0.top.equalTo(topView).offset(margin)
            $0.leading.equalTo(topView)
            $0.trailing.equalTo(topView)
            
        }
        titleAndArtistStackView.snp.makeConstraints{
            $0.top.equalTo(numberLabel.snp.bottom).offset(margin * 2)
            $0.leading.trailing.equalTo(topView)
        }
        
        
        bottomView.snp.makeConstraints{
            $0.top.equalTo(topView.snp.bottom).offset(margin * 2)
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
            $0.trailing.bottom.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
        }
        bottomStackView.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(bottomView)
        }
        memoTextView.snp.makeConstraints{
            $0.top.equalTo(bottomStackView.snp.bottom).offset(margin)
            $0.leading.trailing.equalTo(bottomView)
            $0.bottom.equalTo(bottomView).inset(margin)
        }
       
        //width, height setting
        genderImageView.snp.makeConstraints{
            $0.width.height.equalTo(30)
        }
        toneImageView.snp.makeConstraints{
            $0.width.height.equalTo(30)
        }
        beatImageView.snp.makeConstraints{
            $0.width.height.equalTo(30)
        }
    }
}
    
