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
    var titleText : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customUI()

    }
    
    
    func customUI() {
        self.view.backgroundColor = UIColor.tertiarySystemGroupedBackground
        optionTitleImage.image = UIImage(systemName:"folder.fill")
        optionTitleLabel.text = titleText
        optionTitleLabel.sizeToFit()
    }
}
