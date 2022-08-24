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
import SnapKit
import Then

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setAddSubViews()
        setConstraints()
    }
    
    let kakaoInAppButton = UIButton(type: .system).then {
        //$0.setTitle("로그인", for: .normal)
        //$0.setTitleColor(.white, for: .normal)
        //https://stackoverflow.com/questions/1469474/setting-an-image-for-a-uibutton-in-code
        $0.setImage(UIImage(named: "kakao_login_medium_wide"), for: .normal)
        //$0.titleLabel?.font = UIFont.spoqa(size: 18, family: .bold)
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        //$0.addTarget(self, action: #selector(signInTap), for: .touchUpInside)
    }
    
    func setAddSubViews() {
        self.view.addSubview(kakaoInAppButton)
        }
    
    func setConstraints() {
            kakaoInAppButton.snp.makeConstraints { make in
                make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 100, right: 20))
            }
    }
}
