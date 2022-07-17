//
//  ViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var memoTablewView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customAppearance()
       
    }
    
    //네비게이션바 커스텀
    func customAppearance() {
        navigationItem.title = "메모"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: .none)
        navigationItem.rightBarButtonItem?.tintColor =  UIColor.systemOrange
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        
        appearance.backgroundColor = UIColor.tertiarySystemGroupedBackground
        
        
        appearance.titleTextAttributes = [
                       .foregroundColor : UIColor.black,
                       .font : UIFont.boldSystemFont(ofSize: 20)
                   ]
        
        
        appearance.largeTitleTextAttributes = [
            .foregroundColor : UIColor.black,
            .font : UIFont.boldSystemFont(ofSize: 40)
                    ]
        
        appearance.shadowColor = nil
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    @IBAction func writeButtonClicked(_ sender: UIBarButtonItem) {
        
        let DetailVC : UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        
        guard let VC = DetailVC.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
        
        self.navigationController?.pushViewController(VC, animated: true)
        
        
    }
    

}

