//
//  DetailViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/17.
//

import UIKit
import RealmSwift
import Foundation.NSString


/*
enum ViewMode {
    case update
    case create
}
*/

class DetailViewController: UIViewController {
    let realm = try! Realm()
    let appearance = UINavigationBarAppearance()
    var memoTask: Memo?
    //var viewMode: ViewMode = .create
    
    
    @IBOutlet var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .systemOrange
        addBarButtonItem()
        
        self.memoTextView.text = self.memoTask?.content
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //memo = realm.objects(Memo.self)
        
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
    
    /*func memoString() -> (title : String, content: String) {
        
        if !memoTextView.text.isEmpty {
            
            let title = memoTextView.text?.split(separator: "\n", maxSplits: 1).map(String.init)[0]
            let content = memoTextView.text?.split(separator: "\n", maxSplits: 1).map(String.init)[1]
        
        } else {
            let title = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[0]
            let content = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[1]
            
        }
        
        return (title, content)
        
    } */

    
    func saveData() {
        
        let currentDate = Date()
        
        if !memoTextView.text.isEmpty {
            if self.memoTask?._id != nil {
                
                // 업데이트
                try! realm.write {
                    self.memoTask?.content = memoTextView.text
                    self.memoTask?.createdDate = currentDate
                    self.memoTask?.updatedDate = currentDate
                    
                }
            } else {
                // 생성
                let saveContent = Memo(content: self.memoTextView.text, createdDate: currentDate, updatedDate: currentDate, deletedDate: nil)
                try! realm.write {
                    realm.add(saveContent)
                }
            }
        }
        
        
        
        
//        guard let text = memoTextView.text, text != "" else { return }
//        //var memoTask = Memo()
//        let memoTextArray = text.pasringConntectText
//        let nullText: String = "추가 텍스트 없음"
//
//
//        if memoTextArray.count == 1 {
//
//            memoTask = Memo(title: memoTextArray[0], content: nullText)
//
//        } else {
//
//            //제목있음
//            if memoTextArray[0].replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: .whitespaces).count != 0 {
//                //내용있음
//                if memoTextArray[1].replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: .whitespaces).count != 0 {
//                    memoTask = Memo(title: memoTextArray[0], content: memoTextArray[1])
//                //제목 있고 내용 없음
//                } else {
//                    memoTask = Memo(title: memoTextArray[0], content: nullText)
//
//                }
//
//            } else {
//                if memoTextArray[1].replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: .whitespaces).count != 0 {
//                memoTask = Memo(title: memoTextArray[1], content: nullText)
//                } else {
//                    memoTask = Memo(title: nullText, content: nullText)
//                }
//
//        }
        
        
        
        
        
        /* if !memoTextView.text.isEmpty {
            let nullText: String = "추가 텍스트 없음"
            var memoTask = Memo()
          
            
            let title = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[0]
            
            let content = memoTextView.text.split(separator: "\n", maxSplits: 1).map(String.init)[1]
            
            
            //if title.replacingOccurrences(of: "\n", with: " ").trimmingCharacters(in: .whitespaces).count != 0
            if title.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count != 0 {
                if content.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count != 0 {
                    memoTask = Memo(title: title, content: content)
                } else {
                    memoTask = Memo(title: title, content: nullText)
                }
                
            } else {
                if content.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count != 0 {
                    memoTask = Memo(title: content, content: nullText)
                } else {
                    memoTask = Memo(title: nullText, content: nullText)
                }
                
                try! realm.write{
                    realm.add(memoTask)
                }
                
                
            }
         
         */
        
       // 제목만 추가하고 내용은 없을 시, 내용만 있고 제목은 없어서 내용 첫줄이 제목이 될 때의 예외처리 필요하기 떄문에 로직을 아예 변경..
       // if !memoTextView.text.isEmpty memoString?.count == 2
        
            //if memoString[0] == "\n" && (memoString[1] == "\n" || memoString[1] == " ") {
            
            //let title = memoString[0]
            //let content = memoString[1]
            
            //memoTask = Memo(title: nullText, content: nullText)
            //print(memoTask)
                //try! realm.write{
               //     realm.add(memoTask)
                    
                    
                //}
       // }
    
//    }
        
    }
}







