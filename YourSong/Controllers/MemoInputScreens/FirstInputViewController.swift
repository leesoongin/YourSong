//
//  FirstInputMemoScreenViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/24.
//

/*
 장르 입력 화면
 */

import UIKit
import SnapKit
import Then

class FirstInputViewController: UIViewController {
    let bottomView: UIView = UIView()
    
    let genreLabel = UILabel().then{
        $0.text = "장르를 선택해주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    let firstBottomStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }

    let balladeButton: UIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("발라드", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 0
        $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    let danceButton: UIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("댄스", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 1
        $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    let hiphopButton: UIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("힙합", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 2
        $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    let secondBottomStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    let rNbButton: UIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("R & B", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 3
        $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    let popsongButton: UIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("팝송", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 4
        $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    let nextButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
        $0.isEnabled = false
    }
    
    @objc func buttonPressed(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.layer.borderColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            // 나머지 버튼 false 로 만들기
            for button in buttons{
                if button.tag != sender.tag{
                    button.isSelected = false
                    button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
            }//for
        }else{
            sender.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
        checkCondition()
    }
    
    @objc func next(_ sender: UIButton){
        let secondInputVC = SecondInputViewController()
        secondInputVC.selectedMusic = self.selectedMusic
        self.navigationController?.pushViewController(secondInputVC, animated: true)
    }
    
    @objc func close(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    var selectedMusic: PopularChartMusic?
    var buttons: [UIButton] = [UIButton]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setNavigationItem()
        setLayout()
        setButtonGroup()
    }
    
    func checkCondition(){
        for button in buttons{
            if button.isSelected == true{
                self.nextButton.isEnabled = true
                self.nextButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                return
            }
        }
        self.nextButton.isEnabled = false
        self.nextButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        print("정보를 입력해주세요!")
    }
    
    func setButtonGroup(){
        buttons.append(balladeButton)
        buttons.append(danceButton)
        buttons.append(hiphopButton)
        buttons.append(popsongButton)
        buttons.append(rNbButton)
    }
    
    func setLayout(){
        let margin: CGFloat = 16
        
        self.view.addSubview(bottomView)
        bottomView.addSubview(genreLabel)
        bottomView.addSubview(firstBottomStackView)
        bottomView.addSubview(secondBottomStackView)
        bottomView.addSubview(nextButton)
        firstBottomStackView.addArrangedSubview(balladeButton)
        firstBottomStackView.addArrangedSubview(danceButton)
        firstBottomStackView.addArrangedSubview(hiphopButton)
        secondBottomStackView.addArrangedSubview(popsongButton)
        secondBottomStackView.addArrangedSubview(rNbButton)
        
        bottomView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        
        genreLabel.snp.makeConstraints{
            $0.top.equalTo(bottomView).offset(margin)
            $0.leading.equalTo(bottomView)
            $0.trailing.equalTo(bottomView)
        }
        
        firstBottomStackView.snp.makeConstraints{
            $0.top.equalTo(genreLabel.snp.bottom).offset(margin * 2)
            $0.leading.trailing.equalTo(bottomView)
        }
        secondBottomStackView.snp.makeConstraints{
            $0.top.equalTo(firstBottomStackView.snp.bottom).offset(margin / 2)
            $0.leading.trailing.equalTo(bottomView)
        }
        
        nextButton.snp.makeConstraints{
            $0.top.equalTo(secondBottomStackView.snp.bottom).offset(margin)
            $0.trailing.equalTo(bottomView)
            $0.width.equalTo(self.view.frame.size.width / 2 - (margin * 2))
            $0.height.equalTo(40)
        }
        balladeButton.snp.makeConstraints{
            $0.height.equalTo(40)
        }
        popsongButton.snp.makeConstraints{
            $0.height.equalTo(40)
        }
    }
    
    func setNavigationItem(){
        let leftBarButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(close(_:))).then{
            $0.image = UIImage(systemName: "xmark")
            $0.tintColor = .black
        }
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
}

