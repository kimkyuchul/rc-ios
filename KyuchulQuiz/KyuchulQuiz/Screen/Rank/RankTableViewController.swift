//
//  RankTableViewController.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/19.
//

import UIKit

class RankTableViewController: UIViewController {

    @IBOutlet var rankTableView: UITableView!
    
    // var gameRankDict: [String:Any] = [] 와 같음?
    
    /*var imageArray : [UIImage] = []
     imageArray.append(nil) --> 성립 안댐
     -----------------------
     var imageArray = [UIImage?]()
     imageArray.append(nil) -> 가능
     
     위와 같은 차이 발생할수도?
     */
    
    var imageArray = [UIImage?]()
    var gameRankDict = [String:Any]()
    var nameArr = [String]()
    var pointArr = [Int]()
    var gameRankResultDict = [String:Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankTableView.dataSource = self
        rankTableView.dataSource = self
        rankInfo()
        
        let nibName = UINib(nibName: "RankTableViewCell", bundle: nil)
        self.rankTableView.register(nibName, forCellReuseIdentifier: "RankTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rankTableView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.tertiarySystemGroupedBackground
    }
    
    func rankInfo(){
        
        gameRankDict = UserDefaults.standard.dictionary(forKey: "RANK_INFO")!
        
        nameArr = Array(gameRankDict.keys)
        
        for val in gameRankDict.values {
            pointArr.append(val as! Int)
        }
        
        for i in 0..<nameArr.count {
            gameRankResultDict[nameArr[i]] = pointArr[i]
        }
    }
    
    
    @IBAction func exitAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension RankTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameRankResultDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = rankTableView.dequeueReusableCell(withIdentifier: "RankTableViewCell", for: indexPath) as? RankTableViewCell else { return UITableViewCell()}
        
        //https://pskbhnsr.tistory.com/48 딕셔너리 정렬
        let sortedResult = gameRankResultDict.sorted{$0.1 > $1.1}
        
        cell.rankLabel.text = "\(indexPath.row+1)"
        cell.rankNameLabel.text = sortedResult[indexPath.row].key
        cell.rankPointLabel.text = "\(sortedResult[indexPath.row].value)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
