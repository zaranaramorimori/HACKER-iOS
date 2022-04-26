//
//  LogoutViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/03/25.
//

import UIKit
import SnapKit
import Then

class LogoutViewController: UIViewController {
    
    // MARK: - Properties
    
    private let dimmedBackView = UIView().then {
        $0.backgroundColor = .hackerBackgroundBlack
    }
    
    private let popUpView = UIView().then {
        $0.backgroundColor = .hackerWhite
        $0.layer.cornerRadius = 40
    }
    
    private let logoutLabel = UILabel().then {
      $0.font = .subtitleMedium(ofSize: 16)
        $0.textColor = .hackerBlack
        $0.text = "로그아웃할까요?"
    }
    
    private let yesButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "yesnoButton"), for: .normal)
        $0.setupButton(title: "네", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
        $0.addTarget(self, action: #selector(touchYesButton(_:)), for: .touchUpInside)
        $0.isUserInteractionEnabled = true
    }
    
    private let noButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "yesnoButton"), for: .normal)
        $0.setupButton(title: "아니요", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
        $0.addTarget(self, action: #selector(touchNoButton(_:)), for: .touchUpInside)
        $0.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupAutoLayout()
    }
    
    // MARK: - Custom Method
    
    private func configUI() {
        view.backgroundColor = .hackerWhite
    }
    
    private func setupAutoLayout() {
        view.addSubviews([dimmedBackView, popUpView,
                          logoutLabel,
                          yesButton, noButton])
        
        dimmedBackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popUpView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(35)
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(212)
        }
        
        logoutLabel.snp.makeConstraints { make in
            make.top.equalTo(self.popUpView).inset(58)
            make.centerX.equalToSuperview()
        }
        
        yesButton.snp.makeConstraints { make in
            make.leading.equalTo(self.popUpView).inset(24)
            make.bottom.equalTo(self.popUpView).inset(24)
            make.width.equalTo(120)
            make.height.equalTo(60)
        }
        
        noButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.popUpView).inset(24)
            make.bottom.equalTo(self.popUpView).inset(24)
            make.width.equalTo(120)
            make.height.equalTo(60)
        }
    }
    
    // MARK: - @objc
    
    @objc func touchYesButton(_ sender: UIButton) {
        print("touchYesButton")
    }
    
    @objc func touchNoButton(_ sender: UIButton) {
        print("touchNoButton")
    }
}
