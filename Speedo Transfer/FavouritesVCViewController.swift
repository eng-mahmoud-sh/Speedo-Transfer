//
//  FavouritesVCViewController.swift
//  Speedo Transfer Project
//
//

import UIKit
import FittedSheets

class FavouritesVCViewController: UIViewController {

    @IBOutlet weak var favouriteTableView: UITableView!
    let favCell: String = "FavouriteListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerNavigationBarTitle()
        favouriteTableView.dataSource = self
        favouriteTableView.delegate = self
        favouriteTableView.register(UINib(nibName: "FavouriteListCell", bundle: nil), forCellReuseIdentifier: favCell)
    }

    func centerNavigationBarTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Favourite"
        titleLabel.textColor = UIColor.init(named: "FavouriteWordColor")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.sizeToFit()
        self.navigationItem.style = .editor
        navigationItem.titleView = titleLabel
    }
}

extension FavouritesVCViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // Adjust this to reflect the initial number of rows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: favCell , for: indexPath) as! FavouriteListCell
        cell.delegate = self // تعيين الـ delegate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // Set the height for the cell
    }
}

extension FavouritesVCViewController: FavouriteListCellDelegate {
    func didTapEditButton(in cell: FavouriteListCell) {
        guard let indexPath = favouriteTableView.indexPath(for: cell) else { return }
        print("Edit button tapped in row \(indexPath.row)")
        
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditVC else {
            print("Could not instantiate EditVC")
            return
        }
        
        let sheetController = SheetViewController(controller: editVC, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius = 50
        sheetController.gripColor = UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
    }
}
