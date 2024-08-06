//
//  favoritsTableViewCell.swift
//  Speedo Transfer
//

import UIKit

class favoritsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var favLabelName: UILabel!
    
    
    @IBOutlet weak var favAccLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.borderWidth = 2.0
        cellView.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        if selected {
            cellView.layer.borderColor = UIColor(named: "borderCellColor")?.cgColor
        } else {
            cellView.layer.borderColor = UIColor.clear.cgColor
        }
        
        
    }
    
}
