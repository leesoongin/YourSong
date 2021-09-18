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
    
    private let number = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    private let rankText = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    private let rankUpOrDownText  = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 10)
        $0.textColor = .systemRed
    }
    private let ownerImage = UIImageView().then{
        $0.image = UIImage(named: "ownerLogo")
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 15
    }
    private let titleText = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.lineBreakMode = .byTruncatingTail
        $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    private let artistText = UILabel().then{
        $0.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
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

        self.contentView.addSubview(number)
        self.contentView.addSubview(rankText)
        self.contentView.addSubview(rankUpOrDownText )
        self.contentView.addSubview(ownerImage)
        self.contentView.addSubview(titleText)
        self.contentView.addSubview(artistText)
        
        
        rankText.snp.makeConstraints {
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        rankUpOrDownText .snp.makeConstraints{
            $0.leading.equalTo(rankText.snp.trailing).offset(margin)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        number.snp.makeConstraints{
            $0.leading.equalTo(rankUpOrDownText .snp.trailing).offset(margin)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        ownerImage.snp.makeConstraints{
            $0.width.height.equalTo(15)
            $0.leading.equalTo(number.snp.trailing).offset(margin)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
        }

        titleText.snp.makeConstraints{
            $0.leading.equalTo(ownerImage.snp.trailing).offset(margin)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        artistText.snp.makeConstraints{
            $0.leading.greaterThanOrEqualTo(titleText.snp.trailing).offset(margin)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
        }
    }
    
    func setBind(number: String, rank: String, rankUp: String, rankDown: String, title: String, artist: String){
        self.number.text = number
        self.rankText.text = rank
        self.titleText.text = title
        self.artistText.text = artist
        
        if rankUp == "" && rankDown == ""{
            self.rankUpOrDownText .text = "-"
        }else if rankUp != "" {
            self.rankUpOrDownText .textColor = .systemRed
            self.rankUpOrDownText .text = rankUp
        }else{
            self.rankUpOrDownText .textColor = .systemBlue
            self.rankUpOrDownText .text = rankDown
        }
    }
}
