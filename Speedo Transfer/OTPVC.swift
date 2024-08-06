//
//  OTPVC.swift
//  Speedo Transfer
//

import UIKit
import OTPFieldView

class OTPVC: UIViewController {

    @IBOutlet weak var otpTextField: OTPFieldView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.style = .editor
        title = "Bank Card OTP"
        
        setupOTPTextField()
        setupActionButton()
    }
    
    
//    @IBAction func submitRefillBtnTapped(_ sender: Any) {
//        let accountConnected = self.storyboard?.instantiateViewController(withIdentifier: "AccountConnectedVC") as! AccountConnectedVC
//        self.navigationController?.pushViewController(accountConnected, animated: true)
//    }
    
    
    func setupOTPTextField() {
        otpTextField.fieldsCount = 6
        otpTextField.fieldBorderWidth = 1
        
        otpTextField.defaultBorderColor = UIColor(named: "OTPborderColor")!
        otpTextField.filledBorderColor = UIColor(named: "ButtonColor")!
        otpTextField.cursorColor = UIColor(named: "ButtonColor")!
        otpTextField.displayType = .roundedCorner
        otpTextField.fieldSize = 52
        otpTextField.separatorSpace = 1
        otpTextField.shouldAllowIntermediateEditing = false
        otpTextField.delegate = self
        otpTextField.initializeUI()
        
        for subview in otpTextField.subviews {
            if let textField = subview as? UITextField {
                textField.layer.cornerRadius = 12
                textField.frame.size.width = 40 
                textField.clipsToBounds = true
                textField.textColor = UIColor(named: "ButtonColor")!
            }
        }
    }
    
    func setupActionButton() {
        actionButton.isEnabled = false
        actionButton.backgroundColor = UIColor.lightGray
        actionButton.layer.cornerRadius = 6
        actionButton.setTitle("Submit Refill", for: .normal)
    }
    
    func updateActionButtonState(isEnabled: Bool) {
        actionButton.isEnabled = isEnabled
        actionButton.backgroundColor = isEnabled ? UIColor(named: "ButtonColor")!: UIColor.lightGray
        actionButton.setTitle(isEnabled ? "Sign on" : "Submit Refill", for: .normal)
        actionButton.tintColor = .white
    }
}

extension OTPVC: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
            print("Has entered all OTP? \(hasEntered)")
            updateActionButtonState(isEnabled: true)
            return true
        }
        
        func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
            return true
        }
        
        func enteredOTP(otp otpString: String) {
            print("OTPString: \(otpString)")
        }
    
    func hasEnteredAllOTP(hasEntered: Bool) {
        updateActionButtonState(isEnabled: hasEntered)
    }
    

   
}
