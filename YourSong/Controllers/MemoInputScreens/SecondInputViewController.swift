//
//  SecondInputMemoScreenViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/24.
//

/*
성별: 남성 여성
음정: -3 ~ +3
박자: -3 ~ +3
 입력화면
 */

import UIKit

class SecondInputViewController: UIViewController {
    let alertLabel = UILabel().then{
        $0.text = "나만의 음정, 박자를 입력해주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    let genderLabel = UILabel().then{
        $0.text = "성별"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    let genderStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    let maleButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("남성", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 0
        $0.addTarget(self, action: #selector(genderButtonPressed(_:)), for: .touchUpInside)
    }
    let femaleButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("여성", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 1
        $0.addTarget(self, action: #selector(genderButtonPressed(_:)), for: .touchUpInside)
    }
    
    let toneLabel = UILabel().then{
        $0.text = "음정"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    let toneStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    let toneButtonOne = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("-3", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 0
        $0.addTarget(self, action: #selector(toneButtonPressed(_:)), for: .touchUpInside)
    }
    let toneButtonTwo = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("-2", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 1
        $0.addTarget(self, action: #selector(toneButtonPressed(_:)), for: .touchUpInside)
    }
    let toneButtonThree = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("-1", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 2
        $0.addTarget(self, action: #selector(toneButtonPressed(_:)), for: .touchUpInside)
    }
    let toneButtonFour = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("기본", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 3
        $0.addTarget(self, action: #selector(toneButtonPressed(_:)), for: .touchUpInside)
    }
    let toneButtonFive = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("+1", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 4
        $0.addTarget(self, action: #selector(toneButtonPressed(_:)), for: .touchUpInside)
    }
    let toneButtonSix = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("+2", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 5
        $0.addTarget(self, action: #selector(toneButtonPressed(_:)), for: .touchUpInside)
    }
    let toneButtonSeven = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("+3", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 6
        $0.addTarget(self, action: #selector(toneButtonPressed(_:)), for: .touchUpInside)
    }
    
    let beatLabel = UILabel().then{
        $0.text = "박자"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    let beatStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    let beatButtonOne = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("-3", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 0
        $0.addTarget(self, action: #selector(beatButtonPressed(_:)), for: .touchUpInside)
    }
    let beatButtonTwo = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("-2", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 1
        $0.addTarget(self, action: #selector(beatButtonPressed(_:)), for: .touchUpInside)
    }
    let beatButtonThree = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("-1", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 2
        $0.addTarget(self, action: #selector(beatButtonPressed(_:)), for: .touchUpInside)
    }
    let beatButtonFour = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("기본", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 3
        $0.addTarget(self, action: #selector(beatButtonPressed(_:)), for: .touchUpInside)
    }
    let beatButtonFive = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("+1", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 4
        $0.addTarget(self, action: #selector(beatButtonPressed(_:)), for: .touchUpInside)
    }
    let beatButtonSix = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("+2", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 5
        $0.addTarget(self, action: #selector(beatButtonPressed(_:)), for: .touchUpInside)
    }
    let beatButtonSeven = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        $0.setTitle("+3", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .selected)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.tag = 6
        $0.addTarget(self, action: #selector(beatButtonPressed(_:)), for: .touchUpInside)
    }
    
    let nextButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
    }
    
    @objc func next(_ sender: UIButton){
        let thirdInputVC = ThirdInputViewController()
        thirdInputVC.selectedMusic = self.selectedMusic
        
        self.navigationController?.pushViewController(thirdInputVC, animated: true)
    }
    
    @objc func genderButtonPressed(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.layer.borderColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            // 나머지 버튼 false 로 만들기
            for button in genderButtons{
                if button.tag != sender.tag{
                    button.isSelected = false
                    button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
            }//for
        }else{
            sender.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    @objc func toneButtonPressed(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.layer.borderColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            // 나머지 버튼 false 로 만들기
            for button in toneButtons{
                if button.tag != sender.tag{
                    button.isSelected = false
                    button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
            }//for
        }else{
            sender.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    @objc func beatButtonPressed(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.layer.borderColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            // 나머지 버튼 false 로 만들기
            for button in beatButtons{
                if button.tag != sender.tag{
                    button.isSelected = false
                    button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
            }//for
        }else{
            sender.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    var selectedMusic: PopularChartMusic?
    var genderButtons: [UIButton] = [UIButton]()
    var toneButtons: [UIButton] = [UIButton]()
    var beatButtons: [UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setNavigationItem()
        setLayout()
        setGenderButtons()
        setToneButtons()
        setBeatButtons()
    }
    
    func setNavigationItem(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func setGenderButtons(){
        self.genderButtons.append(maleButton)
        self.genderButtons.append(femaleButton)
    }
    func setToneButtons(){
        self.toneButtons.append(toneButtonOne)
        self.toneButtons.append(toneButtonTwo)
        self.toneButtons.append(toneButtonThree)
        self.toneButtons.append(toneButtonFour)
        self.toneButtons.append(toneButtonFive)
        self.toneButtons.append(toneButtonSix)
        self.toneButtons.append(toneButtonSeven)
    }
    func setBeatButtons(){
        self.beatButtons.append(beatButtonOne)
        self.beatButtons.append(beatButtonTwo)
        self.beatButtons.append(beatButtonThree)
        self.beatButtons.append(beatButtonFour)
        self.beatButtons.append(beatButtonFive)
        self.beatButtons.append(beatButtonSix)
        self.beatButtons.append(beatButtonSeven)
    }
    
    func setLayout(){
        let margin: CGFloat = 16
        self.view.addSubview(alertLabel)
        self.view.addSubview(genderLabel)
        self.view.addSubview(genderStackView)
        self.view.addSubview(toneLabel)
        self.view.addSubview(toneStackView)
        self.view.addSubview(beatLabel)
        self.view.addSubview(beatStackView)
        self.view.addSubview(nextButton)
        genderStackView.addArrangedSubview(maleButton)
        genderStackView.addArrangedSubview(femaleButton)
        toneStackView.addArrangedSubview(toneButtonOne)
        toneStackView.addArrangedSubview(toneButtonTwo)
        toneStackView.addArrangedSubview(toneButtonThree)
        toneStackView.addArrangedSubview(toneButtonFour)
        toneStackView.addArrangedSubview(toneButtonFive)
        toneStackView.addArrangedSubview(toneButtonSix)
        toneStackView.addArrangedSubview(toneButtonSeven)
        beatStackView.addArrangedSubview(beatButtonOne)
        beatStackView.addArrangedSubview(beatButtonTwo)
        beatStackView.addArrangedSubview(beatButtonThree)
        beatStackView.addArrangedSubview(beatButtonFour)
        beatStackView.addArrangedSubview(beatButtonFive)
        beatStackView.addArrangedSubview(beatButtonSix)
        beatStackView.addArrangedSubview(beatButtonSeven)
        
        alertLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        
        genderLabel.snp.makeConstraints{
            $0.top.equalTo(alertLabel.snp.bottom).offset(margin * 2)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        genderStackView.snp.makeConstraints{
            $0.top.equalTo(genderLabel.snp.bottom).offset(margin)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        
        toneLabel.snp.makeConstraints{
            $0.top.equalTo(genderStackView.snp.bottom).offset(margin * 2)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        toneStackView.snp.makeConstraints{
            $0.top.equalTo(toneLabel.snp.bottom).offset(margin)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        
        beatLabel.snp.makeConstraints{
            $0.top.equalTo(toneStackView.snp.bottom).offset(margin * 2)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        beatStackView.snp.makeConstraints{
            $0.top.equalTo(beatLabel.snp.bottom).offset(margin)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(margin)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
        }
        
        nextButton.snp.makeConstraints{
            $0.top.equalTo(beatStackView.snp.bottom).offset(margin * 2)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(margin)
            $0.width.equalTo(self.view.frame.size.width / 2 - (margin * 2))
            $0.height.equalTo(40)
        }
        
    }
    
}
