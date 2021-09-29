//
//  MusicListDetailViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/28.
//

import UIKit

class MusicListDetailViewController: UIViewController {
    let flowLayout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 32
        $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    lazy var collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: self.flowLayout).then{
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.register(MyMusicCell.self, forCellWithReuseIdentifier: MyMusicCell.identifier)
    }
    
    var musicList: OwnMusicList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        config()
        setLayout()
    }
    
    func config(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setLayout(){
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

extension MusicListDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let musicList = self.musicList else { return 0 }
        
        return musicList.getItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyMusicCell.identifier, for: indexPath) as? MyMusicCell else {
            return UICollectionViewCell()
        }
        guard let musicList = self.musicList else { return UICollectionViewCell() }
        
        cell.config(ownList: musicList.getItems()[indexPath.row])
        
        return cell
    }
    
    
}

extension MusicListDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension MusicListDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 16
        let width: CGFloat = self.view.frame.width - (margin * 2)
        let height: CGFloat = collectionView.frame.height - (margin * 4)
        
        print("adssd --> \(self.view.frame.height)")
        print("2222 --> \(collectionView.frame.height)")
        print("view width -----> \(width) , cell height ----> \(height)")
        
        return CGSize(width: width, height: height)
    }
}
