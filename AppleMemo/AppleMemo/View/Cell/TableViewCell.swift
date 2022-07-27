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
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(data: Memo) {
        let rowData = data.getCellData()
        let date = DateFormatter.dateFommatterUse(date: data.createdDate)
        
        titleLabel.text = rowData.title
        contentLabel.text = rowData.content
        contentLabel.numberOfLines = 1
        dateLabel.text = date
    }
    
    
}
