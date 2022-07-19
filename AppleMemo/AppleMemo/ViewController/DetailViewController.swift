//
//  DetailViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/17.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    let realm = try! Realm()
    
    let memo: Memo
    
    @IBOutlet var memoTextView: UITextView!
    let appearance = UINavigationBarAppearance()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .systemOrange
        addBarButtonItem()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appearance.backgroundColor = UIColor.white
        appearance.shadowColor = nil
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
            
    }
    
    
   
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        
        appearance.backgroundColor = UIColor.tertiarySystemGroupedBackground
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    

    
    
    func addBarButtonItem() {
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "완료", style: .plain, target: self, action:.none),
            UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: .none)]
        }
    
    
    func getMemoItem(memo: Memo) {
        let title = memoTextView.map(<#T##transform: (UITextView) throws -> U##(UITextView) throws -> U#>)
    }
    
    
    
    
    
}
     
        

    
    
    

        

    
   
