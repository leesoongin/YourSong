//
//  PopularChartCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/18.
//

import UIKit
import SnapKit
import Then

class PopularChartCell: UITableViewCell {
    static let identifier: String = "popularChartCell"
    
    private let rankText = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    private let rankUpOrDownText  = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 8)
        $0.textColor = .systemRed
        $0.textAlignment = .center
    }
    private let ownerImage = UIImageView().then{
        $0.image = UIImage(named: "musicLogo")
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 15
    }
    private let titleText = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.lineBreakMode = .byTruncatingTail
        $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
    }
    private let artistText = UILabel().then{
        $0.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        $0.font = UIFont.boldSystemFont(ofSize: 11)
        $0.textColor = .systemGray
    }
    
    private lazy var addButton = UIButton().then{
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(addToOwnList(_:)), for: .touchUpInside)
    }
    
    @objc func addToOwnList(_ sender: UIButton){
        print("여기서 나만의 리스트 추가하자!")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }  

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setLayout(){
        let margin: CGFloat = 8
        let size: CGFloat = 20
        self.contentView.addSubview(rankText)
        self.contentView.addSubview(rankUpOrDownText )
        self.contentView.addSubview(ownerImage)
        self.contentView.addSubview(titleText)
        self.contentView.addSubview(artistText)
        self.contentView.addSubview(addButton)
        
        rankUpOrDownText.snp.makeConstraints{
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.width.equalTo(size)
        }
        
        rankText.snp.makeConstraints {
            $0.leading.equalTo(rankUpOrDownText.snp.trailing).offset(margin)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.width.equalTo(26)
        }
        
        ownerImage.snp.makeConstraints{
            $0.width.height.equalTo(size)
            $0.leading.equalTo(rankText.snp.trailing).offset(margin)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
        }

        titleText.snp.makeConstraints{
            $0.leading.equalTo(ownerImage.snp.trailing).offset(margin)
            $0.top.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        artistText.snp.makeConstraints{
            $0.leading.equalTo(ownerImage.snp.trailing).offset(margin)
            $0.top.equalTo(titleText.snp.bottom)
            $0.bottom.equalTo(self.contentView.safeAreaLayoutGuide).inset(4)
        }
        addButton.snp.makeConstraints{
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
            $0.leading.greaterThanOrEqualTo(titleText.snp.trailing).offset(margin)
            $0.leading.greaterThanOrEqualTo(artistText.snp.trailing).offset(margin)
            $0.width.height.equalTo(14)
        }
    }
    
    func setBind(rank: String, rankUp: String, rankDown: String, title: String, artist: String){
        self.rankText.text = rank
        self.titleText.text = title
        self.artistText.text = artist
        
        if rankUp == "" && rankDown == ""{
            self.rankUpOrDownText .textColor = .black
            self.rankUpOrDownText .text = "-"
        }else if rankUp != "" {
            self.rankUpOrDownText .textColor = .systemRed
            self.rankUpOrDownText.text = rankUp
        }else{
            self.rankUpOrDownText .textColor = .systemBlue
            self.rankUpOrDownText.text = rankDown
        }
    }
}
