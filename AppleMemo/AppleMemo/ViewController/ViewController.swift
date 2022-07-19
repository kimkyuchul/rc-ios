//
//  ViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/17.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    let realm = try! Realm()
    
    let test : [String] = ["김규철", "김규철", "김규철", "김규철"]
    let test1 : [String] = ["김규1철", "김규1철", "김규1철", "김규1철"]

    @IBOutlet var memoToolBar: UIToolbar!
    @IBOutlet var memoTablewView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customAppearance()
        
        memoTablewView.delegate = self
        memoTablewView.dataSource = self
        
        memoTablewView.backgroundColor = UIColor.tertiarySystemGroupedBackground
        memoToolBar.barTintColor = UIColor.tertiarySystemGroupedBackground
        
        //self.memoTablewView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "memoTableViewCell")
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        self.memoTablewView.register(nibName, forCellReuseIdentifier: "memoTableViewCell")
    }
    
    //네비게이션바 커스텀
    func customAppearance() {
        navigationItem.title = "메모"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: .none)
        navigationItem.rightBarButtonItem?.tintColor =  UIColor.systemOrange
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchBar = UISearchController(searchResultsController: nil)
        searchBar.searchBar.placeholder = "검색"
        self.navigationItem.searchController = searchBar
        
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

extension ViewController:UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         guard let cell = memoTablewView.dequeueReusableCell(withIdentifier: "memoTableViewCell") as? TableViewCell else { return UITableViewCell() }
         
         cell.titleLable?.text = self.test[indexPath.row]
         cell.contentLable?.text = self.test[indexPath.row]
         
         return cell
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.test.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //}
    
    
    
    
    
    
}

