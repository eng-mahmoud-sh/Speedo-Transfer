//
//  SettingVC.swift
//  Speedo Transfer
//

import UIKit

class SettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.style = .editor
        title = "Setting"
    }
    
    
    @IBAction func changePassBtnTapped(_ sender: Any) {
        let changePass = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.navigationController?.pushViewController(changePass, animated: true)
    }
    
    @IBAction func editProfileBtnTapped(_ sender: Any) {
        let editProfile = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        self.navigationController?.pushViewController(editProfile, animated: true)
    }
}
