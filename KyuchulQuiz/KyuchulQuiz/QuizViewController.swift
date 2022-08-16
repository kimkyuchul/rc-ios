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
    
    
    @IBOutlet var quizCount: UILabel!
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
        self.quizCollectionView.delegate = self
        self.quizCollectionView.dataSource = self
        getQuizData()
        nextButton.isEnabled = false

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.systemGray3
        self.quizCollectionView.backgroundColor = UIColor.systemGray3
        NotificationCenter.default.addObserver(self, selector: #selector(nextButtonEnable(_:)), name: Notification.Name("nextButtonEnable"), object: nil)
        
    }

    
    @IBAction func exitAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
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
                UserDefaults.standard.set(point, forKey: "APPpoint")
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

