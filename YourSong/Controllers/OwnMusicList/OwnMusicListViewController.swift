//
//  OwnMusicListViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/16.
//

import UIKit
import Then
import SnapKit

protocol OwnMusicListDelegate{
    func reloadData()
}

class OwnMusicListViewController: UIViewController {
    let flowLayout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 16
        $0.sectionInset = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    }
    
    lazy var collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: self.flowLayout).then{
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.register(OwnListCell.self, forCellWithReuseIdentifier: OwnListCell.identifier)
    }
    
    private let dataManager = OwnListDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setNavigationItem()
        setLayout()
        config()
        dataManager.readData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataManager.readData()
        self.collectionView.reloadData()
    }
    
    func config(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setNavigationItem(){
        let rightBarButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(addOwnList(_:))).then{
            $0.image = UIImage(systemName: "plus")
            $0.tintColor = .black
        }
        
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.title = "내 플레이리스트"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func addOwnList(_ sender: Any){
        let namingVC = NamingViewController()
        namingVC.delegate = self
        
        self.present(namingVC, animated: true, completion: nil)
    }
    
    func setLayout(){
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

extension OwnMusicListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataManager.getOwnLists().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OwnListCell.identifier, for: indexPath) as? OwnListCell else {
            return UICollectionViewCell()
        }
        
        cell.config(ownList: self.dataManager.getOwnLists()[indexPath.row])
        
        return cell
    }
    
    
}

extension OwnMusicListViewController: UICollectionViewDelegate {
    
}

extension OwnMusicListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 16
        let width: CGFloat = self.view.frame.width - (margin * 2)
        let height: CGFloat = 200
        
        print("view width -----> \(width) , cell height ----> \(height)")
        
        return CGSize(width: width, height: height)
    }
}

extension OwnMusicListViewController: OwnMusicListDelegate{
    func reloadData() {
        dataManager.readData()
        self.collectionView.reloadData()
    }
}
