//
//  TableViewCell.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/19.
//

import UIKit
import SwiftUI
import RealmSwift



class TableViewCell: UITableViewCell {
    
    @IBOutlet  weak var titleLabel: UILabel!
    @IBOutlet  weak var contentLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(data: Memo) {
        titleLabel.text = data.title
        contentLabel.text = data.content
        contentLabel.numberOfLines = 1
    }
    
    
}
