//
//  IndicatorView.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/23.
//

import UIKit
import SnapKit

//https://velog.io/@borysarang/UIActivityIndicatorView, https://velog.io/@qudgh849/UIActivityIndicatorView-%EC%82%AC%EC%9A%A9%EB%B2%95
class IndicatorView: UIView {

    static let shared = IndicatorView()
    let viewForActivityIndicator = UIView()
    let activityIndicator = UIActivityIndicatorView()
    
    func show(backgoundColor: UIColor) {
          self.frame = UIScreen.main.bounds
          self.backgroundColor = backgoundColor
          self.alpha = 0.5
          DispatchQueue.main.async {[weak self] in
              self?.showIndicatorView()
          }
      }

      func hide() {
          DispatchQueue.main.async {[weak self] in
              self?.dismissIndicatorView()
          }
      }
    
    private func showIndicatorView() {
        
        self.viewForActivityIndicator.layer.cornerRadius = 10
        self.viewForActivityIndicator.backgroundColor = UIColor.systemGray3
        self.activityIndicator.style = .large
        self.activityIndicator.color = .green
        
        UIApplication.shared.windows.first?.addSubview(self)
        self.addSubview(self.viewForActivityIndicator)
        self.viewForActivityIndicator.addSubview(self.activityIndicator)
        
        self.viewForActivityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        self.activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        self.activityIndicator.startAnimating()
    }
    
    private func dismissIndicatorView() {
           self.alpha = 1
           self.activityIndicator.stopAnimating()
           self.activityIndicator.removeFromSuperview()
           self.viewForActivityIndicator.removeFromSuperview()
           self.removeFromSuperview()
       }
    

}
