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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(optionButtonTapped(sender:)))
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
    
    @objc func optionButtonTapped(sender: UIBarButtonItem) {
        
        //https://stackoverflow.com/questions/42106980/how-to-present-a-viewcontroller-on-half-screen
        
        if #available(iOS 15.0, *) {
            let optionVC : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let VC = optionVC.instantiateViewController(withIdentifier: "Option") as? optionViewController else { return }
            
            if let presentationController = VC.presentationController as? UISheetPresentationController {
                presentationController.detents = [.medium(), .large()]
            }
            
            /*
            1. SecondVC라는 타입을 가진 VC 인스턴스 생성
            2. 그 인스턴스 위에다가 text 프로퍼티에 값을 부착
            3. present를 명령하면, 실제 메모리에 해당 VC를 넣고 화면을 띄우도록 명령!
            1,2번 과정에서 인스턴스에 값을 붙이고, 3번에서 “실제"화면 전환이 일어나기 때문에, 3번을 실행하지 않으면 절대로 데이터 전달이 일어나지 않는다. 즉, 해당 VC를 push하거나 present까지 진행되어야 데이터가 전달되는 형태
            위에서 설명한 프로퍼티에 접근해서 전달하는 방식은 대부분 화면전환이 이루어지는 과정에서 일어나는 데이터 전달이다.
            그리고 부모 → 자식간 관계를 형성할때 (VC - View 관계) 사용하기도 한다.
             
            직접 프로퍼티 전달을 사용하는 경우
            1. 이전 화면 → 다음 화면으로 화면전환을 할 때 (present, push)
            2. 부모 → 자식 관계일 때
             */
            VC.titleText = self.navigationItem.title!
            self.present(VC, animated: true)
        }
        
        
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






