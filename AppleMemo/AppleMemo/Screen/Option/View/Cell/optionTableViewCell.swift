//
//  optionTableViewCell.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/08/04.
//

import UIKit

class optionTableViewCell: UITableViewCell {

    @IBOutlet var optionTableViewImage: UIImageView!
    @IBOutlet var optionTableViewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.configureCell(icon: nil, titleText: nil)
    }
    
    func configureCell(icon: UIImage?, titleText: String?) {
        self.optionTableViewImage.image = icon
        self.optionTableViewLabel.text = titleText
        
    }
    
}
