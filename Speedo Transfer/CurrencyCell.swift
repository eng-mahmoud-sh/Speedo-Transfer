//
//  CurrencyCell.swift
//  SpeedoTransfer
//
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var currencyImage: UIView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
