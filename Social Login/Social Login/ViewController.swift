//
//  ViewController.swift
//  Social Login
//
//  Created by qualson1 on 2022/08/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import NaverThirdPartyLogin
import Alamofire
import SnapKit
import Then

enum LoginType:String {
    case None = ""
    case KaKao = "kakao"
    case Naver = "naver"
}

class ViewController: UIViewController {
    
    let naverConnection = NaverThirdPartyLoginConnection.getSharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        naverConnection?.delegate = self
        self.view.backgroundColor = UIColor.white
        setAddSubViews()
        setConstraints()
    }
    
    let uiView = UIView().then {
        $0.backgroundColor = UIColor.systemGray
        $0.layer.cornerRadius = 12
        $0.clipsToBounds
    }
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textColor = UIColor.black
        $0.text = "LOGIN TEST"
        $0.sizeToFit()
    }
    
    let kakaoInAppButton = UIButton(type: .custom).then {
        //$0.setTitle("로그인", for: .normal)
        //$0.setTitleColor(.white, for: .normal)
        //https://stackoverflow.com/questions/1469474/setting-an-image-for-a-uibutton-in-code
        $0.setImage(UIImage(named: "kakao_login_medium_wide"), for: .normal)
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(kakaoInAppButtonTap), for: .touchUpInside)
    }
    
    let kakaoInBrowserButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "kakao_login_medium_wide"), for: .normal)
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(kakaoInBrowserTap), for: .touchUpInside)
    }
        
    let kakaoInAppLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = UIColor.black
        $0.text = "카카오 앱 로그인"
    }
    
    let kakaoInBrowserLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = UIColor.black
        $0.text = "카카오톡 웹 로그인"
    }
    
    let naverLoginButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "btnG_완성형"), for: .normal)
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(naverLoginTap), for: .touchUpInside)
    }

    func setAddSubViews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(uiView)
        self.uiView.addSubview(kakaoInAppButton)
        self.uiView.addSubview(kakaoInAppLabel)
        self.uiView.addSubview(kakaoInBrowserButton)
        self.uiView.addSubview(kakaoInBrowserLabel)
        self.uiView.addSubview(naverLoginButton)
        }
    
    //offset: element와의 간격에 사용
    //inset: superView와의 간격에 사용
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(uiView)
            make.bottom.equalTo(uiView.snp.top).offset(-20)
        }
        
        uiView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(350)
        }
        
        kakaoInAppButton.snp.makeConstraints { make in
            make.trailing.equalTo(uiView).offset(20)
            make.leading.equalTo(uiView).offset(-20)
            make.bottom.equalTo(uiView).offset(-50)
        }
        
        kakaoInAppLabel.snp.makeConstraints { make in
            //make.trailing.equalTo(20)
            make.centerX.equalTo(kakaoInAppButton)
            make.bottom.equalTo(kakaoInAppButton.snp.top).offset(5)
            make.height.equalTo(53)
        }
        
        kakaoInBrowserButton.snp.makeConstraints { make in
            make.centerX.equalTo(kakaoInAppLabel)
            make.bottom.equalTo(kakaoInAppLabel.snp.top).offset(-5)
            make.width.equalTo(300)
            make.height.equalTo(45)
        }
        
        kakaoInBrowserLabel.snp.makeConstraints { make in
            make.centerX.equalTo(kakaoInBrowserButton)
            make.bottom.equalTo(kakaoInBrowserButton.snp.top).offset(5)
            make.height.equalTo(53)
        }
        
        naverLoginButton.snp.makeConstraints { make in
            make.centerX.equalTo(kakaoInBrowserLabel)
            make.bottom.equalTo(kakaoInBrowserLabel.snp.top).offset(-5)
            make.width.equalTo(300)
            make.height.equalTo(45)
        
        }
    }
    
    @objc func kakaoInAppButtonTap() {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { [self](oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    _ = oauthToken
            
                    UserDefaultInfo.getUserDefault(.KaKao)
                    getKaKaoUserInfo()
                    
                }
            }
        }
        
    }
    
    @objc func kakaoInBrowserTap() {
        UserApi.shared.loginWithKakaoAccount { [self](oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                _ = oauthToken
                
                UserDefaultInfo.getUserDefault(.KaKao)
                getKaKaoUserInfo()
            }
        }
    }
    
        func getKaKaoUserInfo() {
            //사용자 정보 가져오기
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("me() success.")
                    
                    if let user = user {
                        var scopes = [String]()
                        //if (user.kakaoAccount?.profileNeedsAgreement == true) { scopes.append("profile") }
                        if (user.kakaoAccount?.emailNeedsAgreement == true) { scopes.append("account_email") }
                        
                        let nickname = user.kakaoAccount?.profile?.nickname
                        let email = user.kakaoAccount?.email
                        
                        let nextVC = LogoutViewController()
                        
                        // 사용자 정보 넘기기
                        nextVC.nicknameText = nickname ?? ""
                        nextVC.emailText = email ?? ""
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true, completion: nil)
                        
                        if scopes.count > 0 {
                            print("사용자에게 추가 동의를 받아야 합니다.")
                            _ = user
                        }
                    }
                }
            }
        }
    // 카카오톡 설치 여부 확인
    /*
     @objc
        func kakaoSignInButtonPress() {
            // 카카오톡 설치 여부 확인
            if UserApi.isKakaoTalkLoginAvailable() {
                // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
                카카오톡 로그인 함수 실행()
            } else {
                // 만약, 카카오톡이 깔려있지 않을 경우에는 웹 브라우저로 카카오 로그인함.
                카카오 웹으로 로그인 실행 ()
            }
        }
    }
    */
    
    @objc func naverLoginTap() {
        naverConnection?.requestThirdPartyLogin()
    }
}


extension ViewController: NaverThirdPartyLoginConnectionDelegate {
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success Login")
        self.getInfo()
        UserDefaultInfo.getUserDefault(.Naver)

    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        self.getInfo()
    }

    func oauth20ConnectionDidFinishDeleteToken() {
        print("logout")
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
    
    func getInfo() {
        // 현재 토큰이 유효한지 확인 > default로 1시간
        guard let isValidAccessToken = naverConnection?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = naverConnection?.tokenType else { return }
        guard let accessToken = naverConnection?.accessToken else { return }
        
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        let req = AF.request(url, method: .get, parameters: nil,
                             encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON {(response) in
            print(response)
            
            guard let result = response.value as? [String: AnyObject] else { return }
            guard let object = result["response"] as? [String: AnyObject] else { return }
            let name = object["name"] as? String
            guard let email = object["email"] as? String else { return }
            //let id = object["id"] as? String
            //let image = object["profile_image"] as? String
            
            let nextVC = LogoutViewController()
            
            // 사용자 정보 넘기기
            nextVC.nicknameText = name ?? ""
            nextVC.emailText = email ?? ""
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
    }
}

}
