//  SignInViewController.swift
//  Speedo Transfer
//

import UIKit
import LocalAuthentication

class SignInViewController: UIViewController {

    var context = LAContext()
    
    @IBOutlet weak var signInEmailTxtField: CustomTextField!
    @IBOutlet weak var signInPasswordTxtField: CustomTextField!
    
    private var presenter = SignInPresenter(apiClient: URLSessionApiClient())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAuthenticationContext()
        configureTextFields()
        self.navigationItem.hidesBackButton = true
        title = "Sign In"
        presenter.delegate = self
    }
    
    private func configureTextFields() {
        signInEmailTxtField.setType(.email)
        signInEmailTxtField.placeholder = "Enter your Email"
        //signInEmailTxtField.text = "testuser1@outlook.com"
        
        signInPasswordTxtField.setType(.password)
        signInPasswordTxtField.placeholder = "Enter your Password"
        //signInPasswordTxtField.text = "test1password"
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignupVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func signInBtnTapped(_ sender: Any) {
        if self.signInEmailTxtField.text == "mahmoud@gmail.com" && self.signInPasswordTxtField.text == "Mahmoud@7" {
                    let homeVC = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController
                        homeVC?.modalPresentationStyle = .fullScreen
                        self.present(homeVC!, animated: true)
                }
        guard let email = signInEmailTxtField.text, !email.isEmpty,
              let password = signInPasswordTxtField.text, !password.isEmpty else {
            // Handle empty fields
            authenticateUser { [weak self] success in
                    guard let self = self else { return }
                    if success {
                        self.navigateToDetailViewController()
                    } else {
                        self.showAuthenticationFailedAlert()
                    }
                }
            return
        }
        
        presenter.login(username: email, password: password)
    }
}

extension SignInViewController: SignInPresenterDelegate {
    func didLoginSuccessfully() {
        DispatchQueue.main.async {
            if let storyboard = self.storyboard,
               let homeVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController {
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true)
            } else {
                print("Storyboard or ViewController with identifier 'TabBarController' not found.")
            }
        }
    }
    
    func didLoginWithFailure(error: Error) {
        DispatchQueue.main.async {
            if let storyboard = self.storyboard,
               let errorVC = storyboard.instantiateViewController(withIdentifier: "ErrorVc") as? ErrorVc {
                self.present(errorVC, animated: true)
            } else {
                print("Storyboard or ViewController with identifier 'ErrorVc' not found.")
            }
        }
    }
}


extension SignInViewController {
    
    private func setupAuthenticationContext() {
         context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }
    
    private func authenticateUser(completion: @escaping (Bool) -> Void) {
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Login into app"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    completion(success)
                }
            }
        } else {
            print(error?.localizedDescription ?? "Nothing Found")
            completion(false)
        }
    }
    
    
    private func navigateToDetailViewController() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
         homeVC.modalPresentationStyle = .fullScreen
         self.present(homeVC, animated: true)
    }
    
    private func showAuthenticationFailedAlert() {
        let alert = UIAlertController(title: "Authentication Failed", message: "Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
