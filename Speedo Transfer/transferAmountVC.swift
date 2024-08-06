//
//  transferAmountVC.swift
//  Speedo Transfer
//

import UIKit
import FittedSheets

class transferAmountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.style = .editor
        title = "Transfer"
        
    }
    
    @IBAction func favoriteBtnTapped(_ sender: Any) {
        guard let countrySheet = storyboard?.instantiateViewController(withIdentifier: "favouritsVC") as? favouritsVC else {
            print("Could not instantiate favouritsVC")
            return
        }
        
        let sheetController = SheetViewController(controller: countrySheet, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius=50
        sheetController.gripColor=UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
    }
    
    
    @IBAction func continueTransferBtnTapped(_ sender: Any) {
        let secondTransfer = self.storyboard?.instantiateViewController(withIdentifier: "transferAmount2VC") as! transferAmount2VC
           self.navigationController?.pushViewController(secondTransfer, animated: true)
    }
    
}
