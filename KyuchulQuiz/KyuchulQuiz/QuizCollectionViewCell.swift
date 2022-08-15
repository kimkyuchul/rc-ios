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
    
    @IBOutlet var option1Label: UILabel!
    @IBOutlet var option2Label: UILabel!
    @IBOutlet var option3Label: UILabel!
    @IBOutlet var option4Label: UILabel!
    @IBOutlet var questionLabel: UILabel!
    
    private var correntAnswer: String?
    
    
    @IBOutlet var option1View: UIControl!
    @IBOutlet var option2View: UIControl!
    @IBOutlet var option3View: UIControl!
    @IBOutlet var option4View: UIControl!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(data: Questions) {
        
        questionLabel.text = data.question
        
        option1Label.text = data.option_1
        option2Label.text = data.option_2
        option3Label.text = data.option_3
        option4Label.text = data.option_4
        
        correntAnswer = data.correct_answer
    }
    
   
    @IBAction func option1Action(_ sender: Any) {
        changeUI(selectedOption: .optionA)
    }
    

    @IBAction func option2Action(_ sender: Any) {
        changeUI(selectedOption: .optionB)
    }
    
    
    @IBAction func option3Action(_ sender: Any) {
        changeUI(selectedOption: .optionC)
    }
    
    
    @IBAction func option4Action(_ sender: Any) {
        changeUI(selectedOption: .optionD)
    }
    
    
    func changeUI(selectedOption: selectedOption) {
        switch selectedOption {
        case .optionA:
            updateUI(uiView: option1View, borderWidth: 4)
            updateUI(uiView: option2View)
            updateUI(uiView: option3View)
            updateUI(uiView: option4View)
        case .optionB:
            updateUI(uiView: option2View, borderWidth: 4)
            updateUI(uiView: option1View)
            updateUI(uiView: option3View)
            updateUI(uiView: option4View)
        case .optionC:
            updateUI(uiView: option3View, borderWidth: 4)
            updateUI(uiView: option2View)
            updateUI(uiView: option1View)
            updateUI(uiView: option4View)
        case .optionD:
            updateUI(uiView: option4View, borderWidth: 4)
            updateUI(uiView: option2View)
            updateUI(uiView: option3View)
            updateUI(uiView: option1View)
        }
    }
    
    
    
    func updateUI(uiView: UIView, borderWidth: CGFloat = 0) {
        uiView.layer.borderWidth = borderWidth
        uiView.layer.borderColor = UIColor.white.cgColor
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
