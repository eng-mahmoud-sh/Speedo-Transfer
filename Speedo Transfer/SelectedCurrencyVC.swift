//
//  SelectedCurrencyVC.swift
//  SpeedoTransfer
//
//

import UIKit

class SelectedCurrencyVC: UIViewController {
    
    @IBOutlet weak var currenctTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currenctTableView.delegate = self
        currenctTableView.dataSource = self
        
            super.viewDidLoad()
            
            self.navigationItem.style = .editor
            title = "Select Currancy"
            
        }
        
        @IBAction func getStartedBtnTapped(_ sender: Any) {
            let addCards = self.storyboard?.instantiateViewController(withIdentifier: "AddCardVC") as! AddCardVC
            self.navigationController?.pushViewController(addCards, animated: true)
        }
}

extension SelectedCurrencyVC : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = currenctTableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CurrencyCell
            cell.checkImage.image = UIImage(named: "Path 3391")
//        cell.backgroundColor = .blue
//        tableView.deselectRow(at: indexPath, animated: true	)
    }
    
    
    
    
    
}
