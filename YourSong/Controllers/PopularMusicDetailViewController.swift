//
//  PopularMusicDetailViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/20.
//

import UIKit
import SnapKit
import Then

class PopularMusicDetailViewController: UIViewController {

    
    var backgroundImageView: UIImageView = UIImageView().then{
        $0.image = UIImage(named: "detailViewBackground")
        $0.contentMode = .scaleAspectFit
    }
    let backgroundView: UIView = UIView().then{
        $0.backgroundColor = .black
        $0.alpha = 0.7
    }
    let topView: UIView = UIView()
    
    let numberLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    let titleLabel: UILabel = UILabel().then{
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 4
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .white
    }
    
    let artistLabel: UILabel = UILabel().then{
//        $0.text = "artist Label test"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    let bottomView: UIView = UIView()
    
    let bottomStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    let composerLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    let lyricistLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    let releaseDateLabel: UILabel = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .white
    }
    
    let addButton: UIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitle("나만의 리스트에 추가", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(addToOwnList(_:)), for: .touchUpInside)
    }
    
    @objc func close(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addToOwnList(_ sender: UIButton){
        if checkOwnMusicListExist(){
            let firstInputViewController = FirstInputViewController()
            let containerVC = UINavigationController(rootViewController: firstInputViewController)
            
            containerVC.modalPresentationStyle = .fullScreen
            firstInputViewController.selectedMusic = self.selectedMusic
            
            self.present(containerVC, animated: true, completion: nil)
        }
    }
    
    var selectedMusic: PopularChartMusic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        guard let selectedMusic = self.selectedMusic else {
            print("selectedMusic is nil")
            return
        }
        
        setLayout()
        setNavigationItem()
        bind(music: selectedMusic)
    }

    func checkOwnMusicListExist() -> Bool{
        // 만약 존재한다면
        return true
        //else
        //checkAlert()
        //false
    }
    
    func checkAlert(){
        let alert = UIAlertController(title: "나만의 리스트", message: "나만의 리스트를 먼저 만들어주세요!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "넹 !", style: .default) { (ok) in }
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func bind(music: PopularChartMusic){
        numberLabel.text = "KY \(music.getNumber())"
        titleLabel.text = music.getTitle()
        artistLabel.text = music.getArtist()
        composerLabel.text = "작곡가: \(music.getComposer())"
        lyricistLabel.text = "작사가: \(music.getLyricist())"
        releaseDateLabel.text = "발매일: \(music.getReleaseDate())"
    }
    
    func setNavigationItem(){
        let leftBarButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(close(_:))).then{
            $0.image = UIImage(systemName: "chevron.backward")
            $0.tintColor = .white
        }
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setLayout(){
        let margin: CGFloat = 16
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(backgroundView)
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        topView.addSubview(numberLabel)
        topView.addSubview(titleLabel)
        topView.addSubview(artistLabel)
        bottomView.addSubview(bottomStackView)
        bottomView.addSubview(addButton)
        bottomStackView.addArrangedSubview(composerLabel)
        bottomStackView.addArrangedSubview(lyricistLabel)
        bottomStackView.addArrangedSubview(releaseDateLabel)
        
        backgroundImageView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        backgroundView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
       
        
        topView.snp.makeConstraints{
            $0.top.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
            $0.height.equalTo(240)
        }
        
        numberLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(numberLabel.snp.bottom).offset(margin)
            $0.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview()
        }
        artistLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview()
        }
        
        
        bottomView.snp.makeConstraints{
            $0.top.equalTo(topView.snp.bottom).offset(margin)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        
        bottomStackView.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview().inset(margin)
            $0.height.equalTo(90)
        }
        
        addButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(margin)
            $0.trailing.bottom.equalToSuperview().inset(margin)
            $0.height.equalTo(60)
        }
    }
}
