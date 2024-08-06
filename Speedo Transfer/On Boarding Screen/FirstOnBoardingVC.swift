//
//  FirstOnBoardingVC.swift
//  SpeedoTransfer
//
//

import UIKit

class FirstOnBoardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
        let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        self.navigationController?.pushViewController(SignIn, animated: true)
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        let secondOnBoarding = self.storyboard?.instantiateViewController(withIdentifier: "SecondOnBoardingVC") as! SecondOnBoardingVC
       
        self.navigationController?.pushViewController(secondOnBoarding, animated: false)
    }
    
}
