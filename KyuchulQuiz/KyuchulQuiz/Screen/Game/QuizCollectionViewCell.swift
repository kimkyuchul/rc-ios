//
//  QuizCollectionViewCell.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/12.
//

import UIKit

enum selectedOption {
    case optionA
    case optionB
    case optionC
    case optionD
}

class QuizCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var option1Label: UILabel!
    @IBOutlet weak var option2Label: UILabel!
    @IBOutlet weak var option3Label: UILabel!
    @IBOutlet weak var option4Label: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    var quizmodel : Questions? {
        didSet {
            questionLabel.text = quizmodel?.question
            
            option1Label.text = quizmodel?.option_1
            option2Label.text = quizmodel?.option_2
            option3Label.text = quizmodel?.option_3
            option4Label.text = quizmodel?.option_4
            
            correntAnswer = quizmodel?.correct_answer
        }
    }
    
    var quizManager = QuizManager()
    
    private var correntAnswer: String?
     
    @IBOutlet weak var option1View: UIControl!
    @IBOutlet weak var option2View: UIControl!
    @IBOutlet weak var option3View: UIControl!
    @IBOutlet weak var option4View: UIControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /*
    func configureCell(data: Questions) {
        
        questionLabel.text = data.question
        
        option1Label.text = data.option_1
        option2Label.text = data.option_2
        option3Label.text = data.option_3
        option4Label.text = data.option_4
    }
     */
    
    //셀을 초기화
    override func prepareForReuse() {
        updateUI(uiView: option1View)
        updateUI(uiView: option2View)
        updateUI(uiView: option3View)
        updateUI(uiView: option4View)
    }
    
    var selectedAnswer: ((_ seletedAnswer: Bool) -> Void)?
    
    @IBAction func option1Action(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("nextButtonEnable"), object: nil)
        changeUI(selectedOption: .optionA)
        
        var isAnswer = false
        
        if correntAnswer == quizmodel?.option_1 {
            isAnswer = true
        }
        selectedAnswer?(isAnswer)
    }
    

    @IBAction func option2Action(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("nextButtonEnable"), object: nil)
        changeUI(selectedOption: .optionB)
        
        var isAnswer = false
        if correntAnswer == quizmodel?.option_2 {
            isAnswer = true
        }
        
        selectedAnswer?(isAnswer)
    }
    
    
    @IBAction func option3Action(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("nextButtonEnable"), object: nil)
        changeUI(selectedOption: .optionC)
        
        var isAnswer = false
        
        if correntAnswer == quizmodel?.option_3 {
            isAnswer = true
        }
        
        selectedAnswer?(isAnswer)
    }
    
    
    @IBAction func option4Action(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("nextButtonEnable"), object: nil)
        changeUI(selectedOption: .optionD)
        
        var isAnswer = false
        
        if correntAnswer == quizmodel?.option_4 {
            isAnswer = true
        }
        
        selectedAnswer?(isAnswer)
    }
    
    func changeUI(selectedOption: selectedOption) {
        switch selectedOption {
        case .optionA:
            updateUI(uiView: option1View, borderWidth: 8)
            updateUI(uiView: option2View)
            updateUI(uiView: option3View)
            updateUI(uiView: option4View)
        case .optionB:
            updateUI(uiView: option2View, borderWidth: 8)
            updateUI(uiView: option1View)
            updateUI(uiView: option3View)
            updateUI(uiView: option4View)
        case .optionC:
            updateUI(uiView: option3View, borderWidth: 8)
            updateUI(uiView: option2View)
            updateUI(uiView: option1View)
            updateUI(uiView: option4View)
        case .optionD:
            updateUI(uiView: option4View, borderWidth: 8)
            updateUI(uiView: option2View)
            updateUI(uiView: option3View)
            updateUI(uiView: option1View)
        }
    }
    
    func updateUI(uiView: UIView, borderWidth: CGFloat = 0) {
        uiView.layer.borderWidth = borderWidth
        uiView.layer.borderColor = UIColor.systemGray3.cgColor
    }
    
    /*
     @IBAction func tabBackgroudColorButton(_ sender: UIAction) {
     
     if sender == self.option1View {
     self.option1View.backgroundColor = .white
     print("a")
     } else if  sender == self.option2View {
     self.option2View.backgroundColor = .white
     } else if sender == self.option3View {
     self.option3View.backgroundColor = .white
     } else {
     self.option4View.backgroundColor = .white
     }
     
     }
     
     */
    
    
}
