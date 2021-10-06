//
//  TodayRecommandDetailViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/10/05.
//

import UIKit

class TodayRecommandDetailViewController: UIViewController {
    let layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .vertical
    }
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(TodayRecommandDetailCell.self, forCellWithReuseIdentifier: TodayRecommandDetailCell.identifier)
    }
    
    var idx: Int = 0
    private let melonCrawlingManager = MelonCrawlingManager.shared
    private var recommandMusics = [RecommandMusic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupSubviews()
        setupNavigationController()
        
        melonCrawlingManager.requestMusicFromAlbum(index: idx) { response in
            self.recommandMusics.append(contentsOf: response)
            self.collectionView.reloadData()
        }
    }
    
    func setupNavigationController(){
        self.navigationItem.title = "오늘의 추천곡"
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.barTintColor = .white
    }
}

extension TodayRecommandDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recommandMusics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayRecommandDetailCell.identifier, for: indexPath) as? TodayRecommandDetailCell else {
            return UICollectionViewCell()
        }
        cell.config(imageUrl: recommandMusics[indexPath.row].getThumbnailUrl(),
                    title: recommandMusics[indexPath.row].getTitle(),
                    artist: recommandMusics[indexPath.row].getArtist(),
                    rank: recommandMusics[indexPath.row].getRank())
        
        return cell
    }
}

extension TodayRecommandDetailViewController: UICollectionViewDelegate{
    
}

extension TodayRecommandDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.width)/2 - (margin * 2)
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 8.0
        return UIEdgeInsets(top: 0 , left: inset, bottom: 0 , right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32.0
    }
}

private extension TodayRecommandDetailViewController {
    func setupSubviews() {
        let margin: CGFloat = 16.0
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(margin * 2)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
