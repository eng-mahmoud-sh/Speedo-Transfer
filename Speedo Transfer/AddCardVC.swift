//
//  AddCardVC.swift
//  Speedo Transfer
//
//

import UIKit

class AddCardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.style = .editor
        title = "Add Card"
       
    }
    
    
    @IBAction func signOnBtnTapped(_ sender: Any) {
        let loading = self.storyboard?.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingVC
           self.navigationController?.pushViewController(loading, animated: true)
    }

}
