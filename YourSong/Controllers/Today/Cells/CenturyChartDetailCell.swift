//
//  CenturyChartDetailCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/06.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class CenturyChartDetailCell: UITableViewCell {
    static let identifier: String = "CenturyChartDetailCell"
    let thumbnailImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 5.0
    }
    let titleLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .black
    }
    let artistLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 10)
        $0.textColor = .secondaryLabel
    }
    let addButton = UIButton().then{
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .black
//        $0.addTarget(self, action: #selector(addToOwnList(_:)), for: .touchUpInside)
    }
    
    let centerStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
    }
    
//    @objc func addToOwnList(_ sender: UIButton){
//
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config(music: CenturyChartMusic){
        self.thumbnailImageView.kf.setImage(with: URL(string: music.getThumbnailImageUrl()))
        self.titleLabel.text = music.getTitle()
        self.artistLabel.text = music.getArtist()
    }
    
    func setLayout(){
        let margin: CGFloat = 16.0
        
        self.contentView.addSubview(thumbnailImageView)
        self.contentView.addSubview(centerStackView)
        self.contentView.addSubview(addButton)
        centerStackView.addArrangedSubview(titleLabel)
        centerStackView.addArrangedSubview(artistLabel)
        
        thumbnailImageView.snp.makeConstraints{
            $0.width.height.equalTo(42.0)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin)
        }
        
        centerStackView.snp.makeConstraints{
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(margin / 2)
            $0.trailing.lessThanOrEqualTo(addButton.snp.leading).inset(margin / 2)
            $0.top.equalTo(self.contentView.safeAreaLayoutGuide).offset(margin / 2)
            $0.bottom.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin / 2)
        }
        
        addButton.snp.makeConstraints{
            $0.width.height.equalTo(42.0)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.leading.greaterThanOrEqualTo(self.contentView.safeAreaLayoutGuide).offset(margin / 2)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(margin)
        }
    }
}
