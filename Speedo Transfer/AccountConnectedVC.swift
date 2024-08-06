//
//  AccountConnectedVC.swift
//  Speedo Transfer
//

import UIKit

class AccountConnectedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.style = .editor
        title = "Bank Card OTP"
    }
    

//    @IBAction func connectAnotherAccountBtnTapped(_ sender: Any) {
//        let selectedCurrency = self.storyboard?.instantiateViewController(withIdentifier: "SelectedCurrencyVC") as! SelectedCurrencyVC
//        self.navigationController?.pushViewController(selectedCurrency, animated: true)
//    }
//    
//    
//    @IBAction func backToHomeBtnTapped(_ sender: Any) {
//        var homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        self.navigationController?.pushViewController(homeVC, animated: true)
//        homeVC.tabBarController?.selectedIndex = 0
//    }
    
}
