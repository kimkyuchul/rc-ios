//
//  QuizViewController.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/12.
//

import UIKit

class QuizViewController: UIViewController {
    
    var questions:[Questions]?
    var datamodel:DataModel?
    
    var isAnswer = false

    var point = 0
    var index = 0
    var gameRankDict = [String:Any]()
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var quizCollectionView: UICollectionView!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = nextButton.frame.height/2
        }
    }
    
    @IBOutlet var exitButton: UIButton! {
        didSet {
            exitButton.layer.cornerRadius = exitButton.frame.height/2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.dictionaryRepresentation().keys)
        print(UserDefaults.standard.dictionaryRepresentation().values)
        self.quizCollectionView.delegate = self
        self.quizCollectionView.dataSource = self
        getQuizData()
        nextButton.isEnabled = false
        loadUserInfo()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.tertiarySystemGroupedBackground
        self.quizCollectionView.backgroundColor = UIColor.tertiarySystemGroupedBackground
        NotificationCenter.default.addObserver(self, selector: #selector(nextButtonEnable(_:)), name: Notification.Name("nextButtonEnable"), object: nil)
        nameLabel.text =  UserDefaults.standard.string(forKey: "USER_NAME")
        
    }
    
    // 랭크테이블에 값이 쌓이지 않았음 일단 맨 처음에는 이름만 kEY에 들어가니 [String:Any]임 (아직 VAlue에 포인트 값이 넣어지지 않았기 때문) 그렇기 때문에 UserDefaults.standard.dictionary(forKey: "RANK_INFO")이 있으면 (첫 게임 시도가 아니면) gameRankDict = UserDefaults.standard.dictionary(forKey: "RANK_INFO")가 선언된다.?
    // 이해하지 못하였으나, 일단 적용
    func loadUserInfo(){
            if UserDefaults.standard.dictionary(forKey: "RANK_INFO") == nil {
                gameRankDict = [String:Any]()
            } else {
                gameRankDict = UserDefaults.standard.dictionary(forKey: "RANK_INFO") as! [String:Int]
            }
        }

    
    @IBAction func exitAction(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        
            if isAnswer {
                point += 1
                
            }

            if index < (questions?.count ?? 0) - 1 {
                index += 1
                self.quizCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
                nextButton.isEnabled = false
            } else {
                //UserDefaults.standard.set(point, forKey: "RANK_INFO")
                gameRankDict[nameLabel.text ?? "NO NAME"] = point
                print(gameRankDict)
                UserDefaults.standard.set(gameRankDict, forKey: "RANK_INFO")
                guard let VC = storyboard?.instantiateViewController(withIdentifier: "QuizResultViewController") as? QuizResultViewController else { return }
                VC.result = point
                self.navigationController?.pushViewController(VC, animated: true)
                
            }
    
        }
    
    @objc func nextButtonEnable(_ noti: Notification) {
        nextButton.isEnabled = true
    }
    
    func getProgress() -> Float {
        return Float(index) / Float(questions?.count ?? 0)
    }
    

    
    
    /*
     - URLSession Life Cycle0
     session configuration 결정, session 생성
     통신할 URL, Request 객체 설정
     사용할 task 결정, 그에 맞는 completionHandler나 delegate 메소드 작성
     task 실행, task 완료 후 completion Handler 클로저 호출
     */
    func getQuizData() {
        guard let url = URL(string: "https://gist.githubusercontent.com/kimkyuchul/bac626b51566e739838d8b57f26ee5e0/raw/80f2acd9ecce7bbdfbc49fbc1f6f3f0ca0ca6598/kyuchulQuiz.json") else {return}
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            let decoder = JSONDecoder()
            guard let quizInfo = try? decoder.decode(DataModel.self, from: data) else { return }
            
            self.questions = quizInfo.data.questions
            
            DispatchQueue.main.async {
                self.quizCollectionView.reloadData()
            }

        }.resume()
    }
    
 

}


extension QuizViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as? QuizCollectionViewCell else { return QuizCollectionViewCell() }
        
        //let data = questions?[indexPath.row]
        //cell.configureCell(data: data!)
        cell.quizmodel = questions?[indexPath.row]
        cell.option1View.layer.cornerRadius = 15
        cell.option2View.layer.cornerRadius = 15
        cell.option3View.layer.cornerRadius = 15
        cell.option4View.layer.cornerRadius = 15
        cell.selectedAnswer = { [weak self] isAnswer in
            self?.isAnswer = isAnswer
        }
        
        return cell
    }
    
    //위아래간격 (horizontal 상태라서 양옆이 늘어남??)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: quizCollectionView.frame.width, height: quizCollectionView.frame.height)
    }
    
    
}

