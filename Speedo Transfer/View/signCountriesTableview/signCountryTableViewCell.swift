//
//  signCountryTableViewCell.swift
//  Speedo Transfer
//

import UIKit

class signCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImg: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var checkMark: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
