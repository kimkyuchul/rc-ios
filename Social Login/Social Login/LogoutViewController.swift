//
//  LogoutViewController.swift
//  Social Login
//
//  Created by qualson1 on 2022/08/26.
//

import UIKit
import SnapKit
import Then
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import NaverThirdPartyLogin

class LogoutViewController: UIViewController {
    
    var nicknameText : String = ""
    var emailText : String = ""
    private var loginType:LoginType!

    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.text = nicknameText
        emailTextField.text = emailText
        //setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        setAddSubViews()
        setConstraints()
        //setUI()
        print(emailText)
        print(nicknameText)
        
       
        //nicknameTextLabel.text = nicknameText
        
    }
    
    let uiView = UIView().then {
        $0.backgroundColor = UIColor.systemGray
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textColor = UIColor.black
        $0.text = "Login Info"
        $0.sizeToFit()
    }
    
    let nicknameTextField = UITextField().then {
        $0.layer.cornerRadius = 12
        $0.placeholder = "nickname"
        $0.borderStyle = .roundedRect
    
    }

    let emailTextField = UITextField().then {
        $0.layer.cornerRadius = 12
        $0.placeholder = "email"
        $0.borderStyle = .roundedRect
    }
    
    let logoutButton = UIButton(type: .custom).then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.backgroundColor = UIColor.black.cgColor
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(logOut), for: .touchUpInside)
    }
    
    func setAddSubViews() {
        self.view.addSubview(uiView)
        self.view.addSubview(titleLabel)
        self.uiView.addSubview(nicknameTextField)
        self.uiView.addSubview(emailTextField)
        self.uiView.addSubview(logoutButton)
        
        }
    
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(uiView)
            make.bottom.equalTo(uiView.snp.top).offset(-20)
        }
        
        uiView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(300)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(uiView).offset(20)
            make.leading.equalTo(uiView).offset(10)
            make.trailing.equalTo(uiView).offset(-10)
            
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            make.leading.equalTo(uiView).offset(10)
            make.trailing.equalTo(uiView).offset(-10)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(uiView).offset(-20)
            make.leading.equalTo(uiView).offset(10)
            make.trailing.equalTo(uiView).offset(-10)
            make.height.equalTo(50)

        }
    }
    
    @objc func logOut() {
        if loginType == .KaKao {
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("[kakao]logout success")
                    UserDefaultInfo.resetUserDefault()
                    self.dismiss(animated: true, completion: nil)
                    
                }
            }
        }
        else if loginType == .Naver {
            let naverConnection = NaverThirdPartyLoginConnection.getSharedInstance()
            naverConnection?.requestDeleteToken()
        }
        UserDefaultInfo.resetUserDefault()
        self.dismiss(animated: true, completion: nil)
    }
}

