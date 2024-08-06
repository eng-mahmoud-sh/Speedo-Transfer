//
//  ErrorVc.swift
//  SpeedoTransfer
//
//

import UIKit

class ErrorVc: UIViewController {

    @IBOutlet weak var errorImage: UIImageView!
    
    @IBOutlet weak var serverTitle: UILabel!
    @IBOutlet weak var errorMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callUsBTN(_ sender: Any) {
    }
    @IBAction func messageUsBTN(_ sender: UIButton) {
    }
}
