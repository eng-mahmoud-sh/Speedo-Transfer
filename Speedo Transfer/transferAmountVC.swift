//
//  transferAmountVC.swift
//  Speedo Transfer
//

import UIKit
import FittedSheets

class transferAmountVC: UIViewController, CurrencySelectionDelegate {
    
    
    @IBOutlet weak var currImg: UIImageView!
    @IBOutlet weak var selectCurrencyBtn: UIButton!

    @IBOutlet weak var currencyTxtField1: CustomTextField!
    
    @IBOutlet weak var recipientNameTxtField: CustomTextField!
    
    @IBOutlet weak var receiptAccountNumTxtField: CustomTextField!
    @IBOutlet weak var currencyTxField2: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.style = .editor
        title = "Transfer"
        // notification for Favourites
                NotificationCenter.default.addObserver(self, selector: #selector (favouriteDetails), name: NSNotification.Name(rawValue: "favID"), object: nil)
        
    }
    @objc func favouriteDetails(notification: Notification){
            
            var fav = notification.userInfo?["favInfo"] as? Favourites
            
            if let myfav = fav {
                recipientNameTxtField.text = myfav.accountName
                receiptAccountNumTxtField.text = myfav.accountNumber
            }
        }
    @IBAction func selectCurrencyBtnTapped(_ sender: Any) {
        guard let currencySheet = storyboard?.instantiateViewController(withIdentifier: "CurrencyVC") as? CurrencyVC else {
            print("Could not instantiate favouritsVC")
            return
        }
        currencySheet.delegate = self
        let sheetController = SheetViewController(controller: currencySheet, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius=50
        sheetController.gripColor=UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
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
    func didSelectCurrency(currency: Currency) {
        
        var money: Double = Double(currencyTxtField1.text ?? "") ?? 0
        
        currencyTxField2.text = "\(money*49.25)"
        
           currImg.image = currency.image
        switch currency.label {
               case "Egypt":
                   selectCurrencyBtn.setTitle("EGP", for: .normal)
               case "United States":
                   selectCurrencyBtn.setTitle("USD", for: .normal)
               default:
                   selectCurrencyBtn.setTitle(currency.label, for: .normal)
               }
       }
    
}
