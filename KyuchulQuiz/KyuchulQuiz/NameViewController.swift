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
        GoButton.isEnabled = true
        }
   
    
      
    @IBAction func goAction(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "USER_NAME")
        
        guard let pvc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else { return }
        
        self.navigationController?.pushViewController(pvc, animated: true)
        //let rootView = ViewController.self
        
        //guard let pvc = self.rootViewController else { return }

//        let rootView = ViewController()
        
        
//        self.dismiss(animated: false, completion: {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    let childVC2 = self.storyboard?.instantiateViewController(identifier: "QuizViewController") as! QuizViewController
//                    childVC2.modalPresentationStyle = .fullScreen
//                    rootView.present(childVC2, animated: true, completion: nil)
//            }
//                 })
        

    }
    
}
