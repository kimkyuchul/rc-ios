//
//  TableViewCell.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/19.
//

import UIKit
import SwiftUI

class TableViewCell: UITableViewCell {
    
    @IBOutlet  weak var titleLable: UILabel!
    @IBOutlet  weak var contentLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
