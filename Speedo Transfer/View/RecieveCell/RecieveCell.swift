//
//  RecieveCell.swift
//  Speedo Transfer Project
//
//

import UIKit

class RecieveCell: UITableViewCell {

    @IBOutlet weak var RecieveCellView: UIView!
    
    @IBOutlet weak var RecieveTransactionLabel: UILabel!
    
    @IBOutlet weak var TheRecievedLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var RecievedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    // Customize shadow for the view
    RecieveCellView.layer.shadowColor = UIColor(named: "HelpShadowColor"
    )?.cgColor
    RecieveCellView.layer.shadowOpacity = 0.1
    RecieveCellView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        sendEmailView.layer.shadowRadius = 4
//        sendEmailView.layer.masksToBounds = false
    }
    
    
}


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//

