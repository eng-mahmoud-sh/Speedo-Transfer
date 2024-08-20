//
//  favouritsVC.swift
//  Speedo Transfer
//

import UIKit

class favouritsVC: UIViewController {

    var favArray:[Favourites] = [
        Favourites(accountName: "Khalid Gad", accountNumber: "4738 8473 87495 8725"),
        Favourites(accountName: "Ahmed Ashraf", accountNumber: "4559 2947 4758 2948"),
        Favourites(accountName: "Mahmoud El Sharkawy", accountNumber: "2947 4958 2849 8294"),
        Favourites(accountName: "Shery Hany", accountNumber: "0945 47294 9284 8271"),
        Favourites(accountName: "Ahmed Adel", accountNumber: "6178 8490 9271 9274"),
    ]
    
    
    @IBOutlet weak var favoritsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritsTableView.delegate = self
        favoritsTableView.dataSource = self
        favoritsTableView.separatorStyle = .none
        favoritsTableView.register(UINib(nibName: "favoritsTableViewCell", bundle: nil), forCellReuseIdentifier: "favoritsTableViewCell")
        
    }

}
extension favouritsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoritsTableView.dequeueReusableCell(withIdentifier: "favoritsTableViewCell", for: indexPath) as? favoritsTableViewCell else {
            return favoritsTableViewCell()
        }
        
        let fav = favArray[indexPath.row]
        
        cell.favLabelName.text = fav.accountName
        cell.favAccLabel.text = fav.accountNumber

            return cell
        
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = storyboard?.instantiateViewController(identifier: "transferAmountVC") as? transferAmountVC
        
        let fav = favArray[indexPath.row]
        let favInfo = Favourites(accountName: fav.accountName, accountNumber: fav.accountNumber)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "favID"), object: nil, userInfo: ["favInfo":favInfo])
        
        self.dismiss(animated: true)
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    }
    
    

