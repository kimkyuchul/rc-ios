//
//  optionViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/08/01.
//

import UIKit

class optionViewController: UIViewController {

    @IBOutlet var optionTitleLabel: UILabel!
    @IBOutlet var optionTitleImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func customUI() {
        
        optionTitleImage.image = UIImage(named: "foder.fill")
    }
    
    
    


}
