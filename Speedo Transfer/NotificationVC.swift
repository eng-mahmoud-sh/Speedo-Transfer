//
//  NotificationVC.swift
//  Speedo Transfer Project
//
//

import UIKit

class NotificationVC: UIViewController {
    
    
    @IBOutlet weak var NotificationTableView: UITableView!
    
    let recieveCell: String = "RecieveCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationTableView.delegate = self
        NotificationTableView.dataSource = self
        NotificationTableView.register(UINib(nibName: recieveCell, bundle: nil), forCellReuseIdentifier: recieveCell)
       
        self.navigationItem.style = .editor
        title = "Notifications"
    
}
                            
}
extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 10
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: recieveCell , for: indexPath) as! RecieveCell
                
                return cell
            }
    
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 137 // Set the height for the cell
    }
}

