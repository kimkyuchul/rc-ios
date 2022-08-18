//
//  RankTableViewCell.swift
//  KyuchulQuiz
//
//  Created by qualson1 on 2022/08/19.
//

import UIKit

class RankTableViewCell: UITableViewCell {

    @IBOutlet var rankPointLabel: UILabel!
    @IBOutlet var rankNameLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
