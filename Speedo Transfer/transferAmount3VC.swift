//
//  transferAmount3VC.swift
//  Speedo Transfer
//
//

import UIKit

class transferAmount3VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.style = .editor
        title = "Transfer"
    }
    
    @IBAction func backHomeBtnTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    
    @IBAction func addFavouriteBtnTapped(_ sender: Any) {
        
    }
    
    
}
