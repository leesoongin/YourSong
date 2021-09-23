//
//  SearchChartCell.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/22.
//

import UIKit

class SearchChartCell: UITableViewCell {
    static let identifier: String = "SearchChartCell"
    
    private let numberText = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 11)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setLayout(){
        let margin: CGFloat = 8
        let size: CGFloat = 40
        
        self.contentView.addSubview(numberText)
        self.contentView.addSubview(ownerImage)
        self.contentView.addSubview(titleText)
        self.contentView.addSubview(artistText)
        self.contentView.addSubview(addButton)
        
        numberText.snp.makeConstraints{
            $0.leading.equalTo(self.contentView).offset(margin)
            $0.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.width.equalTo(size)
        }
        
        ownerImage.snp.makeConstraints{
            $0.width.height.equalTo(size)
            $0.leading.equalTo(numberText.snp.trailing).offset(margin)
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
    
    func setBind(number: String, title: String, artist: String){
        self.numberText.text = number
        self.titleText.text = title
        self.artistText.text = artist
    }
}
