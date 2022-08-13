//
//  QuizCollectionViewCell.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/12.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var option1Label: UILabel!
    @IBOutlet var option2Label: UILabel!
    @IBOutlet var option3Label: UILabel!
    @IBOutlet var option4Label: UILabel!
    @IBOutlet var questionLabel: UILabel!
    
    private var correntAnswer: String?
    
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

}
