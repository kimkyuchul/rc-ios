//
//  ViewController.swift
//  SoundCloud
//
//  Created by qualson1 on 2022/07/01.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet var followButton: UIButton!
    @IBOutlet var followButton1: UIButton!
    @IBOutlet var followButton2: UIButton!
    @IBOutlet var followButton3: UIButton!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        followButton.layer.cornerRadius = 5
        followButton1.layer.cornerRadius = 5
        followButton2.layer.cornerRadius = 5
        
    
     
        

    }
    

}
