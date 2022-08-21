//
//  NameViewController.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/18.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var GoButton: UIButton!{
        didSet {
            GoButton.layer.cornerRadius = GoButton.frame.height/2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.tertiarySystemGroupedBackground
        self.navigationController?.isNavigationBarHidden = true
        
        GoButton.isEnabled = false
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        
        if nameTextField.text != "" {
            GoButton.isEnabled = true
        } else {
            GoButton.isEnabled = false
        }
    }
   
    
      
    @IBAction func goAction(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "USER_NAME")
        
        guard let pvc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else { return }
        
        self.navigationController?.pushViewController(pvc, animated: true)
        }
    }
