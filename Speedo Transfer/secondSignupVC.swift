//
//  secondSignupVC.swift
//  Speedo Transfer
//


import UIKit
import FittedSheets

class secondSignupVC: UIViewController, CountrySelectionDelegate {
    
    var tempUser: TempUser?
    
    @IBOutlet weak var signCountryTxtField: CustomTextField!
    @IBOutlet weak var signDateTxtField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TxtFields()
        
        // Print tempUser to verify it's being passed correctly
        if let tempUser = tempUser {
            print("TempUser: \(tempUser)")
        } else {
            print("TempUser is nil")
        }
    }
    
    private func TxtFields() {
        signCountryTxtField.setType(.country)
        signCountryTxtField.placeholder = "Select your country"
        
        signCountryTxtField.addTarget(self, action: #selector(showCountryPicker), for: .editingDidBegin)
        
        signDateTxtField.setType(.dateOfBirth)
        signDateTxtField.placeholder = "dd/MM/yyyy"
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        
        guard let tempUser = tempUser else {
            // Handle missing user data
            return
        }
        
        let fullname = tempUser.username
        let email = tempUser.email
        let password = tempUser.password
        let country = signCountryTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Egypt"
        let dateOfBirth = signDateTxtField.text ?? "2024-08-01"

        let user = UserRegistrationRequest(
            username: fullname,
            password: password,
            birthdate: dateOfBirth,
            email: email,
            country: country
        )
        
        print("User object to be sent: \(user)")
        
        AuthService.registerUser(with: user) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("API Response: \(response)")
                    
                    self.goToLoginScreen()
                    
                case .failure(let error):
                    print("API Error: \(error.localizedDescription)")
                    
                    self.goToLoginScreen()
                }
            }
        }
    }
    
    private func goToLoginScreen() {
        let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        self.navigationController?.pushViewController(SignIn, animated: true)
    }
    
    @objc func showCountryPicker() {
        guard let countrySheet = storyboard?.instantiateViewController(withIdentifier: "countrySheetVC") as? countrySheetVC else {
            print("Could not instantiate countrySheetVC")
            return
        }
        countrySheet.delegate = self
        
        let sheetController = SheetViewController(controller: countrySheet, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius = 50
        sheetController.gripColor = UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
    }
    
    func didSelectCountry(country: Country) {
        signCountryTxtField.text = country.label
    }
}
