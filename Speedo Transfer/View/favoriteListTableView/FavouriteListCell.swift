//
//  FavouriteListCell.swift
//  Speedo Transfer Project
//
//

import UIKit
import FittedSheets

protocol FavouriteListCellDelegate: AnyObject {
    func didTapEditButton(in cell: FavouriteListCell)
}

class FavouriteListCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountNumLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!

    weak var delegate: FavouriteListCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    
    
    @IBAction func deleteButton(_ sender: Any) {
    }
    
    @IBAction func editButton(_ sender: Any) {
        delegate?.didTapEditButton(in: self)
        
        
    }
}
    




