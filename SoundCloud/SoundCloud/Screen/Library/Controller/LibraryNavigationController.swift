//
//  LibraryNavigationController.swift
//  SoundCloud
//
//  Created by qualson1 on 2022/07/12.
//

import UIKit

class LibraryNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }

}
