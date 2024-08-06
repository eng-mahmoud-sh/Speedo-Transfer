//
//  MyCardsVC.swift
//  Speedo Transfer
//

import UIKit

class MyCardsVC: UIViewController {

    @IBOutlet weak var cardsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.style = .editor
        title = "My Cards"
    
        cardsTableView.separatorStyle = .none
        cardsTableView.delegate = self
        cardsTableView.dataSource =  self
        let nib = UINib(nibName: "CardsCell", bundle: nil)
        cardsTableView.register(nib, forCellReuseIdentifier: "cardCell")
    }
    
    
    @IBAction func addNewAccountBtnTapped(_ sender: Any) {
        
        let selectedCurrency = self.storyboard?.instantiateViewController(withIdentifier: "SelectedCurrencyVC") as! SelectedCurrencyVC
           self.navigationController?.pushViewController(selectedCurrency, animated: true)
        
    }
    

   

}
extension MyCardsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
        cell.selectionStyle = .none
        
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 120
       }
       

    
    
    }
