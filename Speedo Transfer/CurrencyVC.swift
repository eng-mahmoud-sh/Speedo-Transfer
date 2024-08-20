//
//  CurrencyVC.swift
//  Speedo Transfer
//



import UIKit
import FittedSheets

protocol CurrencySelectionDelegate: AnyObject {
    func didSelectCurrency(currency: Currency)
}

struct Currency {
    let image: UIImage
    let label: String
}

class CurrencyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    weak var delegate: CurrencySelectionDelegate?
    
    var currencies: [Currency] = [Currency(image: UIImage(named: "unitedStates")!, label: "unitedStates"),Currency(image: UIImage(named: "Egypt")! , label: "Egypt")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        currencyTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = currencyTableView.dequeueReusableCell(withIdentifier: "courenciesCell", for: indexPath) as! courenciesCell
        let currency = currencies[indexPath.row]
        cell.cournciesImg.image = currency.image
        cell.cournciesLabel.text = currency.label
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if let cell = tableView.cellForRow(at: indexPath) as? courenciesCell {
               cell.backgroundColor = UIColor(named: "cellColor")

               
               
               let currency = currencies[indexPath.row]
               delegate?.didSelectCurrency(currency: currency)
               
               tableView.deselectRow(at: indexPath, animated: true)
               
               self.dismiss(animated: true, completion: nil)
           }
       }
    
   

}
