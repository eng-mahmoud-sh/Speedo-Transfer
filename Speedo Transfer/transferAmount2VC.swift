//
//  transferAmount2VC.swift
//  Speedo Transfer
//
//

import UIKit

class transferAmount2VC: UIViewController {

    
    @IBOutlet weak var viewFrom: UIView!
    @IBOutlet weak var viewTo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewFrom.layer.cornerRadius = 8
        viewTo.layer.cornerRadius = 8
        self.navigationItem.style = .editor
        title = "Transfer"
    }
    func scheduleNotigication() {
        let content = UNMutableNotificationContent()
        content.title = "Speedo Transfer"
        content.subtitle = "Successfully was Transferred"
        content.body = "An Amount of 1000 from your account has been successfully transferred"
        content.sound = .default
        content.badge = 1
        content.launchImageName = "Logo"
        content.userInfo = ["name": "my test name"]
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(1), repeats: false)
        let request = UNNotificationRequest(identifier: "testID", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    @IBAction func continueTransferBtnTapped(_ sender: Any) {
        let thirdTransfer = self.storyboard?.instantiateViewController(withIdentifier: "transferAmount3VC") as! transferAmount3VC
           self.navigationController?.pushViewController(thirdTransfer, animated: true)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]){granted, error in
            if granted {
                print("granted")
                DispatchQueue.main.async{
                    self.scheduleNotigication()
                }
            }else {
                print("denied")
            }
        }
    }
    
    @IBAction func previousTransferBtnTapped(_ sender: Any) {
        let transfer = self.storyboard?.instantiateViewController(withIdentifier: "transferAmountVC") as! transferAmountVC
           self.navigationController?.pushViewController(transfer, animated: true)
    }
    

}
