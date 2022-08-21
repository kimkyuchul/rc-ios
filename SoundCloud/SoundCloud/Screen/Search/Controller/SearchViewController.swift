//
//  SearchViewController.swift
//  SoundCloud
//
//  Created by qualson1 on 2022/07/01.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBarCustom()

        
    }
    
    
    func SearchBarCustom() {
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.setImage(UIImage(named: "icSearchNonW"), for: UISearchBar.Icon.search, state: .normal)
        searchBar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor.gray
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
                        //서치바 텍스트입력시 색 정하기
                        textfield.textColor = UIColor.white
                        //왼쪽 아이콘 이미지넣기
                        if let leftView = textfield.leftView as? UIImageView {
                            leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                            //이미지 틴트컬러 정하기
                            leftView.tintColor = UIColor.white
                        }
                        //오른쪽 x버튼 이미지넣기
                        if let rightView = textfield.rightView as? UIImageView {
                            rightView.image = rightView.image?.withRenderingMode(.alwaysTemplate)
                            //이미지 틴트 정하기
                            rightView.tintColor = UIColor.white
                        }
            
            
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
