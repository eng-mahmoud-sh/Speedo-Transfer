import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var signNameTxtField: CustomTextField!
    @IBOutlet weak var signEmailTxtField: CustomTextField!
    @IBOutlet weak var signPasswordTxtField: CustomTextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TxtFields()
        setupNavBar()
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
      
        if isValidData() {
            let fullName = signNameTxtField.text?.trimmed ?? ""
            let email = signEmailTxtField.text?.trimmed ?? ""
            let password = signPasswordTxtField.text?.trimmed ?? ""
            
            let tempUser = TempUser(username: fullName, email: email, password: password)
            goToCompleteRegisterScreen(with: tempUser)
        }
    }
    
    private func goToCompleteRegisterScreen(with tempUser: TempUser) {
        let SignUp2 = self.storyboard?.instantiateViewController(withIdentifier: "secondSignupVC") as! secondSignupVC
        SignUp2.tempUser = tempUser
        self.navigationController?.pushViewController(SignUp2, animated: true)
    }
    
    @IBAction func signInBtnTapped(_ sender: Any) {
        let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        self.navigationController?.pushViewController(SignIn, animated: true)
    }
    
    private func isValidData() -> Bool {
        guard let name = signNameTxtField.text?.trimmed, !name.isEmpty else {
            showALert(title: "Sorry", message: "Please enter your name!")
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.com"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard let email = signEmailTxtField.text?.trimmed, !email.isEmpty, emailPredicate.evaluate(with: email) else {
            showALert(title: "Sorry", message: "Please enter a valid email address!")
            return false
        }
        
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard let password = signPasswordTxtField.text?.trimmed, !password.isEmpty, passwordPredicate.evaluate(with: password) else {
            showALert(title: "Sorry", message: "Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, and one number.")
            return false
        }
        
        return true
    }
    
    private func setupNavBar() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "DRop down 1")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "DRop down 1")
        navigationItem.leftItemsSupplementBackButton = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        title = "Sign Up"
    }
    
    private func TxtFields() {
        signNameTxtField.setType(.name)
        signNameTxtField.placeholder = "Enter your name"
        
        signEmailTxtField.setType(.email)
        signEmailTxtField.placeholder = "Enter your Email"
        
        signPasswordTxtField.setType(.password)
        signPasswordTxtField.placeholder = "Enter your Password"
    }
}
