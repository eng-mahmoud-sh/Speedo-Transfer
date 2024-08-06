//
//  countrySheetVC.swift
//  Speedo Transfer
//

import UIKit
import FittedSheets

protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(country: Country)
}

struct Country {
    let image: UIImage
    let label: String
}
class countrySheetVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    weak var delegate: CountrySelectionDelegate?
    
    var countries: [Country] = [Country(image: UIImage(named: "unitedStates")!, label: "unitedStates")]
    
    @IBOutlet weak var countrySheetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countrySheetTableView.register(UINib(nibName: "signCountryTableViewCell", bundle: nil), forCellReuseIdentifier: "signCountryTableViewCell")
        countrySheetTableView.delegate = self
        countrySheetTableView.dataSource = self
        countrySheetTableView.separatorStyle = .none
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = countrySheetTableView.dequeueReusableCell(withIdentifier: "signCountryTableViewCell", for: indexPath) as? signCountryTableViewCell else {
            return signCountryTableViewCell()
        }
        let country = countries[indexPath.row]
        cell.cellImg.image = country.image
        cell.cellLabel.text = country.label
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if let cell = tableView.cellForRow(at: indexPath) as? signCountryTableViewCell {
               cell.backgroundColor = UIColor(named: "cellColor")

               cell.checkMark.image = UIImage(named: "checkMark")
               
               let country = countries[indexPath.row]
               delegate?.didSelectCountry(country: country)
               
               tableView.deselectRow(at: indexPath, animated: true)
               
               self.dismiss(animated: true, completion: nil)
           }
       }
    
}
