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
    
    
    @IBOutlet var memoTextView: UITextView!
    let appearance = UINavigationBarAppearance()
    
    var textSpace:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .systemOrange
        addBarButtonItem()
        
        memoTextView.text = textSpace
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appearance.backgroundColor = UIColor.white
        appearance.shadowColor = nil
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
            
    }
    
    
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        appearance.backgroundColor = UIColor.tertiarySystemGroupedBackground
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        saveData()
        print(saveData())
        
    }
    

    
    
    func addBarButtonItem() {
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "완료", style: .plain, target: self, action:.none),
            UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: .none)]
        }
    
    
    func saveData() {
        
        let title = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[0]
        let content = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[1]
        
        let memoTask = Memo(title: title, content: content)
        
        if memoTextView != nil {
        
            try! realm.write{
                realm.add(memoTask)
            }
        }

    }
}
        

    
    
    

        

    
   
