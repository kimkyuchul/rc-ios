//
//  QuizResultViewController.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/17.
//

import UIKit

class QuizResultViewController: UIViewController {

    @IBOutlet var resultMessageLabel: UILabel!
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    var result = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMessage()
        resultLabel.text = "10/\(result)"
    }
        
    
    func updateMessage() {
        if result <= 3 {
            resultImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
            resultMessageLabel.text = "This person is not Kyu-Chul's friend."
            resultMessageLabel.textColor = UIColor.red
        } else if result <= 6 {
            resultImageView.image = UIImage(systemName: "It's perfect for Kyu-Chul's friend.")
            resultMessageLabel.text = "It's perfect for Kyu-Chul's friend."
        } else {
            resultImageView.image = UIImage(systemName: "Are you Kyu-Chul's family?")
            resultMessageLabel.text = "Are you Kyu-Chul's family?"
        }
    }

    @IBAction func HomeAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
