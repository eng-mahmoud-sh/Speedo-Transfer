//
//  lastTransactionsVC.swift
//  Speedo Transfer
//
//

import UIKit

class lastTransactionsVC: UIViewController {

    
    @IBOutlet weak var lastTransactionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.style = .editor
        title = "Transactions"
        
        lastTransactionsTableView.separatorStyle = .none
        lastTransactionsTableView.delegate = self
        lastTransactionsTableView.dataSource =  self
        let nib = UINib(nibName: "lastTransactionCell", bundle: nil)
        lastTransactionsTableView.register(nib, forCellReuseIdentifier: "lastTransactionCell")
    }
    

   

}
extension lastTransactionsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lastTransactionCell", for: indexPath)
        cell.selectionStyle = .none
        
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 140
       }
       

    
    
    }
