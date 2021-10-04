//
//  TodayRecommandView.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/04.
//

import UIKit
import SnapKit
import Then

class TodayRecommandView: UIView {
    let layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
    }
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.dataSource = self
        $0.delegate = self
        $0.isPagingEnabled = true
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(TodayRecommandCell.self, forCellWithReuseIdentifier: TodayRecommandCell.identifier)
    }
    
    // 크롤링 해 온 데이터 넣장
    private let melonCrawlingManager = MelonCrawlingManager.shared
    private var albums: [RecommandAlbum] = [RecommandAlbum]()

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
    
    
}

extension TodayRecommandView: UICollectionViewDelegate {
    
}

extension TodayRecommandView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 16.0
        return CGSize(width: collectionView.frame.width - margin * 2, height: collectionView.frame.height - margin * 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        return UIEdgeInsets(top: inset * 2, left: inset, bottom: inset * 2, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32.0
    }
}

private extension TodayRecommandView {
    func setupSubviews() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
