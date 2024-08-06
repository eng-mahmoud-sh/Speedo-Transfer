//
//  ProfileVC.swift
//  Speedo Transfer
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.style = .editor
        title = "Profile"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func personalinfoBtnTapped(_ sender: Any) {
        let personalInfo = self.storyboard?.instantiateViewController(withIdentifier: "PersonalInfoVC") as! PersonalInfoVC
        self.navigationController?.pushViewController(personalInfo, animated: true)
    }
    
    @IBAction func settingBtnTapped(_ sender: Any) {
        let setting = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(setting, animated: true)
    }
    
    @IBAction func paymentHistoryBtnTapped(_ sender: Any) {
        let transaction = self.storyboard?.instantiateViewController(withIdentifier: "lastTransactionsVC") as! lastTransactionsVC
            self.navigationController?.pushViewController(transaction, animated: true)
           //  self.tabBarController?.selectedIndex = 2
    }
    
    @IBAction func favListBtnTapped(_ sender: Any) {
        let favList = self.storyboard?.instantiateViewController(withIdentifier: "FavouritesVCViewController") as! FavouritesVCViewController
        self.navigationController?.pushViewController(favList, animated: true)
    }
}
