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
    
    @IBAction func continueTransferBtnTapped(_ sender: Any) {
        let thirdTransfer = self.storyboard?.instantiateViewController(withIdentifier: "transferAmount3VC") as! transferAmount3VC
           self.navigationController?.pushViewController(thirdTransfer, animated: true)
    }
    
    @IBAction func previousTransferBtnTapped(_ sender: Any) {
        let transfer = self.storyboard?.instantiateViewController(withIdentifier: "transferAmountVC") as! transferAmountVC
           self.navigationController?.pushViewController(transfer, animated: true)
    }
    

}
