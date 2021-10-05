//
//  centuryChartView.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/05.
//

import UIKit
import SnapKit
import Then

class CenturyChartView: UIView {
    let layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
    }
    private let centuryPlayListLabel = UILabel().then{
        $0.text = "📻 시대별 차트"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.dataSource = self
        $0.delegate = self
        $0.isPagingEnabled = true
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(CenturyChartCell.self, forCellWithReuseIdentifier: CenturyChartCell.identifier)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
//        melonCrawlingManager.requestRecommandAlbums{ response in
//            self.albums.append(contentsOf: response)
//            self.collectionView.reloadData()
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CenturyChartView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.albums.count
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CenturyChartCell.identifier, for: indexPath) as? CenturyChartCell else {
            return UICollectionViewCell()
        }
        
        cell.config(idx: indexPath.row)
        
        return cell
    }

}

extension CenturyChartView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let delegate = self.delegate {
//            delegate.moveToDetailView(index: indexPath.row)
//        }
    }
}

extension CenturyChartView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 16.0
        let width: CGFloat = collectionView.frame.width / 2 - margin * 2
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
    // section inset 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32.0
    }
}

private extension CenturyChartView {
    func setupSubviews() {
        let margin: CGFloat = 16.0
        
        self.addSubview(collectionView)
        self.addSubview(centuryPlayListLabel)
        
        centuryPlayListLabel.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview()
        }
        collectionView.snp.makeConstraints{
            $0.top.equalTo(centuryPlayListLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(self.snp.width).dividedBy(2)
        }
    }
}
