//
//  HelpVC.swift
//  Speedo Transfer Project
//
//

import UIKit

class HelpVC: UIViewController {

    @IBOutlet weak var sendEmailView: UIView!
    @IBOutlet weak var callUsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize shadow for the view
        sendEmailView.layer.shadowColor = UIColor(named: "HelpShadowColor"
        )?.cgColor
        sendEmailView.layer.shadowOpacity = 0.1
        sendEmailView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        sendEmailView.layer.shadowRadius = 4
//        sendEmailView.layer.masksToBounds = false
        
        callUsView.layer.shadowColor = UIColor(named: "HelpShadowColor"
        )?.cgColor
        callUsView.layer.shadowOpacity = 0.1
        callUsView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    @IBAction func sendEmailButton(_ sender: Any) {
    }
    
   
    @IBAction func callUsButton(_ sender: Any) {
    }
    
}
