//
//  ViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/17.
//

import UIKit
import RealmSwift
import Network

class ViewController: UIViewController {
    
    //Realm 파일에 접근하는 상수 선언
    let realm = try! Realm()
    
    //Realm에서 읽어온 데이터를 담을 배열 선언
    var tasks: Results<Memo>!
    
    @IBOutlet var memoToolBar: UIToolbar!
    @IBOutlet var memoTablewView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = Realm.Configuration.defaultConfiguration.fileURL
        print(fileURL!)

        customAppearance()
        
        memoTablewView.delegate = self
        memoTablewView.dataSource = self
        
        memoTablewView.backgroundColor = UIColor.tertiarySystemGroupedBackground
        memoToolBar.barTintColor = UIColor.tertiarySystemGroupedBackground
        
        //self.memoTablewView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "memoTableViewCell")
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        self.memoTablewView.register(nibName, forCellReuseIdentifier: "memoTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tasks = realm.objects(Memo.self)
        memoTablewView.reloadData()
    }
    
    //네비게이션바 커스텀
    //MARK: - 네비게이션바 커스텀
    //base 뷰컨으로 만들어둬서 다른 뷰컨에서 상속에서 사용
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
        
        //VC.viewMode = .create
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = memoTablewView.dequeueReusableCell(withIdentifier: "memoTableViewCell") as? TableViewCell else { return UITableViewCell() }
        
        
        let data = tasks[indexPath.row]
        cell.configureCell(data: data)
        
        //cell.titleLabel.text = tasks?[indexPath.row].title
        //cell.contentLabel.text = tasks?[indexPath.row].content
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let DetailVC : UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        
        guard let VC = DetailVC.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
        
        let memo = tasks[indexPath.row]
        
        VC.memoTask = memo
//        VC.viewMode = .update
        self.navigationController?.pushViewController(VC, animated: true)
        
        
    }
    
    
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //}
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "삭제") { action, view, success in
            
            // 클로저 순환참조 공부 필요!
            let memo = self.tasks[indexPath.row]
            
            try! self.realm.write {
                self.realm.delete(memo)
            }
            
            self.memoTablewView.deleteRows(at: [indexPath], with: .automatic)
            
            success(true)
            
        }
        
       return UISwipeActionsConfiguration(actions: [delete])
        
        
    }
}








