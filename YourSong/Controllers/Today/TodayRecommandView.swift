//
//  TodayRecommandView.swift
//  YourSong
//
//  Created by ์ด์ญ์ธ on 2021/10/04.
//

import UIKit
import SnapKit
import Then

class TodayRecommandView: UIView {
    let layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
    }
    private let todayPlayListLabel = UILabel().then{
        $0.text = "๐ง ์ค๋์ ํ๋ ์ด๋ฆฌ์คํธ"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.dataSource = self
        $0.delegate = self
        $0.isPagingEnabled = true
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(TodayRecommandCell.self, forCellWithReuseIdentifier: TodayRecommandCell.identifier)
//        $0.register(TodayRecommandHeaderView.self,
//                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                    withReuseIdentifier: TodayRecommandHeaderView.identifier)
    }
    
    // ํฌ๋กค๋ง ํด ์จ ๋ฐ์ดํฐ ๋ฃ์ฅ
    private let melonCrawlingManager = MelonCrawlingManager.shared
    private var albums: [RecommandAlbum] = [RecommandAlbum]()
    var delegate: TodayMusicDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        melonCrawlingManager.requestRecommandAlbums{ response in
            self.albums.append(contentsOf: response)
            self.collectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayRecommandView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayRecommandCell.identifier, for: indexPath) as? TodayRecommandCell else {
            return UICollectionViewCell()
        }
        
        cell.config(imageUrl: albums[indexPath.row].getThumbnailImageUrl(),
                    title: albums[indexPath.row].getAlbumTitle(),
                    musicCount: albums[indexPath.row].getMusicCount(),
                    hashTag: albums[indexPath.row].getHashTag())
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard kind == UICollectionView.elementKindSectionHeader,
//              let header = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: TodayRecommandHeaderView.identifier,
//                for: indexPath
//              ) as? TodayRecommandHeaderView
//        else {
//            return UICollectionReusableView()
//        }
//
//        header.setupViews()
//
//        return header
//    }
}

extension TodayRecommandView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.moveToTodayDetailView(index: indexPath.row)
        }
    }
}

extension TodayRecommandView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 16.0
        let width: CGFloat = collectionView.frame.width - margin * 2
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
    // section inset ์ค์ 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32.0
    }
    
    //section header ํฌ๊ธฐ ์ง์ . ์ํ๋ฉด ์๋ธ ใใใใ
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 40)
//    }
    
}

private extension TodayRecommandView {
    func setupSubviews() {
        let margin: CGFloat = 16.0
        
        self.addSubview(collectionView)
        self.addSubview(todayPlayListLabel)
        
        todayPlayListLabel.snp.makeConstraints{
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(margin)
        }
        collectionView.snp.makeConstraints{
            $0.top.equalTo(todayPlayListLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(self.snp.width)
        }
    }
}
