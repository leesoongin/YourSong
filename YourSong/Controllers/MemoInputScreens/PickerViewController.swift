//
//  PickerViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/25.
//

import UIKit
import SnapKit
import Then

protocol PickerDataSendDelegate {
    func sendData(data: String)
}

class PickerViewController: UIViewController {
    let containerView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    let pickerView = UIPickerView()
    
    let completeButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(complete(_:)), for: .touchUpInside)
    }
    
    @objc func complete(_ sender: UIButton){
        guard let delegate = self.pickerDataDelegate else {
            print("delegate is nil")
            self.dismiss(animated: true, completion: nil)
            return
        }
        delegate.sendData(data: self.selectedOwnList)
        self.dismiss(animated: true, completion: nil)
    }
    
    var pickerDataDelegate: PickerDataSendDelegate?
    let dataManager = OwnListDataManager.shared
    private var selectedOwnList: String = "" // 선택된 나만의 리스트 정보 저장할거다!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        self.dataManager.readData()
        selectedOwnList = dataManager.getOwnListTitles()[0]
        
        config()
        setLayout()
    }
    func config(){
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }
    
    func setLayout(){
        let margin: CGFloat = 16
        self.view.addSubview(containerView)
        self.containerView.addSubview(pickerView)
        self.containerView.addSubview(completeButton)
        
        containerView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        pickerView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        completeButton.snp.makeConstraints{
            $0.top.equalTo(pickerView.snp.bottom).offset(margin * 2)
            $0.leading.equalToSuperview().offset(margin * 2)
            $0.trailing.equalToSuperview().inset(margin * 2)
        }
    }
}

extension PickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataManager.getOwnListTitles().count
    }
}

extension PickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataManager.getOwnListTitles()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedOwnList = self.dataManager.getOwnListTitles()[row]
    }
}

