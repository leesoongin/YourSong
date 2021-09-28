//
//  PickerViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/25.
//

import UIKit
import SnapKit
import Then

//#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
class NamingViewController: UIViewController {
    let containerView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    let stackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 32
    }
    
    let alertLabel = UILabel().then{
        $0.text = "제목을 지어주세요!"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
    }
     
    let titleInputField = UITextField().then{
        $0.placeholder = "제목을 입력해주세요."
        $0.layer.cornerRadius = 10
        $0.borderStyle = .roundedRect
//        $0.clipsToBounds = false
//        $0.layer.shadowOpacity = 0.2
//        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
//        $0.layer.shadowRadius = 5
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    let completeButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.isEnabled = false
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(complete(_:)), for: .touchUpInside)
    }
    
    @objc func complete(_ sender: UIButton){
        // 여기서 ownMusicList name 넣고 items 빈걸로 만들자 ㅋㅋㄱ
        guard let name = titleInputField.text else{
            print("title inpit filed is nil")
            return
        }
        dataManager.createOwnList(name: name)
        self.delegate?.reloadData()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldDidChange(_ sender: Any){
        if self.titleInputField.text != ""{
            completeButton.isEnabled = true
            completeButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }else{
            completeButton.isEnabled = false
            completeButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    private let dataManager = OwnListDataManager.shared
    var delegate: OwnMusicListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }

    func setLayout(){
        let margin: CGFloat = 16
        self.view.addSubview(containerView)
        self.containerView.addSubview(completeButton)
        self.containerView.addSubview(stackView)
        stackView.addArrangedSubview(alertLabel)
        stackView.addArrangedSubview(titleInputField)
        
        containerView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
            
        }
        
        titleInputField.snp.makeConstraints{
            $0.height.equalTo(40)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(margin * 2)
            $0.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview().inset(margin)
        }
        
        completeButton.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(margin * 2)
            $0.leading.equalToSuperview().offset(margin)
            $0.trailing.equalToSuperview().inset(margin)
            $0.height.equalTo(40)
        }
    }
}

