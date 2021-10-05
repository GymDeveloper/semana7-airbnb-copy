//
//  ExploreViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 5/10/21.
//

import UIKit

class ExploreViewController: UIViewController  {
    
    let places: [String] = ["Sur", "Chosica", "Mancora", "Vichayito, Piura, Perú"]
    let descriptions: [String] = ["4 - 6 Dic", "4 - 6 Dic", "19 - 22 Nov", "24 - 26 Dic"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ExploreViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExplore", for: indexPath) as! ExploreTableViewCell
        
        cell.lblTitle.text = places[indexPath.row]
        cell.lblAddrees.text = descriptions[indexPath.row]
        
        if indexPath.row == 0 {
            cell.exploreImage?.image = UIImage(named: "bridge")
        } else if indexPath.row == 1 {
            cell.exploreImage?.image = UIImage(named: "cascade")
        } else if indexPath.row == 2 {
            cell.exploreImage?.image = UIImage(named: "morning")
        } else {
            cell.exploreImage?.image = UIImage(named: "mountains")
        }
        
        cell.lblPrice.text = "$141.00 / night"
        cell.lblRating.text = "4.68"
        cell.lblCountRating.text = "(38)"
        
        let cellView = UIView()
        cellView.backgroundColor = UIColor.systemBackground
        cell.selectedBackgroundView = cellView
        
        return cell
    }
    
}
