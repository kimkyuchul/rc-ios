//
//  infoViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/08/04.
//

import UIKit
import Lottie

class infoViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView: AnimationView = .init(name: "apple")
        self.view.addSubview(animationView)
        
        animationView.frame = self.view.bounds
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop


    }
    

   

}
