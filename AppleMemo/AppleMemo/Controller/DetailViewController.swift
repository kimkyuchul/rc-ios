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
    let appearance = UINavigationBarAppearance()
    
    @IBOutlet var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .systemOrange
        addBarButtonItem()
        
        memoTextView.text = nil
        
        
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
        
        //뷰 사라질 때 다시 회색으로.. (다크모드 설정할 줄 알면 이런 코드도 필요 없을 듯)
        appearance.backgroundColor = UIColor.tertiarySystemGroupedBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        saveData()
        
    }
    
    
    
    
    func addBarButtonItem() {
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "완료", style: .plain, target: self, action:.none),
            UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: .none)]
    }
    
    
    func saveData() {
        
        if !memoTextView.text.isEmpty{
            let title = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[0]
            
            // 제목만 추가하고 내용은 없을 시의 예외처리 필요
            
            let content = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[1]
            
            let memoTask = Memo(title: title, content: content)
            
            if memoTextView != nil {
                
                try! realm.write{
                    realm.add(memoTask)
                }
                
            } /*else {
               try! realm.write {
               realm.delete(memoTask)
               } */
        }
    }
}










