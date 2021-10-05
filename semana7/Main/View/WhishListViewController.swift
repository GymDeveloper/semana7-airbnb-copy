//
//  WhishListViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 28/09/21.
//

import UIKit

class WhishListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let places: [String] = ["Sur", "Chosica", "Mancora", "Vichayito, Piura, Perú"]
    let descriptions: [String] = ["4 - 6 Dic", "4 - 6 Dic", "19 - 22 Nov", "24 - 26 Dic"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension WhishListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemBackground
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = places[indexPath.section]
        cell.detailTextLabel?.text = descriptions[indexPath.section]
        
        cell.imageView?.layer.cornerRadius = 8
        cell.imageView?.layer.masksToBounds = true
        
        if indexPath.section == 0 {
            cell.imageView?.image = UIImage(named: "bridge")
        } else if indexPath.section == 1 {
            cell.imageView?.image = UIImage(named: "cascade")
        } else if indexPath.section == 2 {
            cell.imageView?.image = UIImage(named: "morning")
        } else {
            cell.imageView?.image = UIImage(named: "mountains")
        }
        
        return cell
    }
    
}
