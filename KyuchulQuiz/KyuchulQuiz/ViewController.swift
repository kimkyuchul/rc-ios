//
//  ViewController.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/11.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var sponsorshipButton: UIButton!{
        didSet {
            sponsorshipButton.layer.cornerRadius = sponsorshipButton.frame.height/2
        }
    }
    @IBOutlet var playButton: UIButton! {
        didSet {
            playButton.layer.cornerRadius = playButton.frame.height/2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.tertiarySystemGroupedBackground
    }
    
    
    @IBAction func playAction(_ sender: Any)  {
        
        guard let VC = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else { return }
        
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    /*
    func getQuizData(completion: @escaping (Result<Any, Error>) -> ()) {
        let urlString = "https://gist.githubusercontent.com/kimkyuchul/bac626b51566e739838d8b57f26ee5e0/raw/80f2acd9ecce7bbdfbc49fbc1f6f3f0ca0ca6598/kyuchulQuiz.json"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let requestURL = URLRequest(url: url)
            
            let dataTask = session.dataTask(with: requestURL) { (data, response, error ) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(QuizModel.self, from: safeData)
                        completion(.success(decodedData))
                        DispatchQueue.main.async {
                                print(decodedData)
                                
                                                }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
                
                
            }
            
            dataTask.resume()
        }
        
        
    }
   */
}
