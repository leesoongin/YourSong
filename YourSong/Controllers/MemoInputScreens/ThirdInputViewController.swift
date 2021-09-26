//
//  ThirdInputViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/24.
//

/*
 저장할 리스트: 버튼으로 하고 누르면 피커뷰 띄울까?
 메모 입력 화면: textView
 */

import UIKit
import SnapKit
import Then

class ThirdInputViewController: UIViewController {
    let alertLabel = UILabel().then{
        $0.text = "나만의 음정, 박자를 입력해주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    let pickerViewButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.setTitle("저장할 리스트를 선택해주세요.", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(moveToPickerView(_:)), for: .touchUpInside)
    }
    
    let memoView = UITextView().then{
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = false
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        $0.layer.shadowRadius = 5
        $0.backgroundColor =  #colorLiteral(red: 0.9451435208, green: 0.92419523, blue: 0.9724335074, alpha: 1)
    }
    
    let completeButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(registOwnMusicList(_:)), for: .touchUpInside)
        $0.isEnabled = false
    }
    
    @objc func registOwnMusicList(_ sender: UIButton){
        updateMemoData()
        print("result -> \(ownMusic?.getMusicData())")
    }
    
    @objc func moveToPickerView(_ sender: UIButton){
        let pickerVC = PickerViewController()
        pickerVC.pickerDataDelegate = self
        
        self.present(pickerVC, animated: true, completion: nil)
    }
    
    var ownMusic: OwnMusic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
    }
    
    func updateMemoData(){
        self.ownMusic?.setMemo(self.memoView.text)
    }
    
    func setLayout(){
        let margin: CGFloat = 16
        
        self.view.addSubview(alertLabel)
        self.view.addSubview(pickerViewButton)
        self.view.addSubview(memoView)
        self.view.addSubview(completeButton)
        
        alertLabel.snp.makeConstraints{
            $0.top.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        
        pickerViewButton.snp.makeConstraints{
            $0.top.equalTo(alertLabel.snp.bottom).offset(margin * 2)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
            $0.height.equalTo(40)
        }
        
        memoView.snp.makeConstraints{
            $0.top.equalTo(pickerViewButton.snp.bottom).offset(margin * 2)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
            $0.height.equalTo(200)
        }
        
        completeButton.snp.makeConstraints{
            $0.top.equalTo(memoView.snp.bottom).offset(margin * 2)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
            $0.height.equalTo(40)
        }
        
    }
}

extension ThirdInputViewController: PickerDataSendDelegate {
    func sendData(data: String) {
        self.completeButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.completeButton.isEnabled = true
        self.pickerViewButton.setTitle("\(data)", for: .normal)
    }
}
