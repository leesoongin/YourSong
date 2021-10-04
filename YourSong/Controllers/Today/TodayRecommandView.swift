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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayRecommandView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayRecommandCell.identifier, for: indexPath) as? TodayRecommandCell else {
            return UICollectionViewCell()
        }
        
        
        return cell
    }
    
    
}

extension TodayRecommandView: UICollectionViewDelegate {
    
}

extension TodayRecommandView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32.0, height: collectionView.frame.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32.0
    }
}

private extension TodayRecommandView {
    func setupSubviews() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16.0)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(self.snp.width)
        }
    }
}
