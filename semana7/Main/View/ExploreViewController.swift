//
//  ExploreViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 5/10/21.
//

import UIKit

class ExploreViewController: UIViewController  {
        
    @IBOutlet weak var tableView: UITableView!
    
    let placeViewModel = PlaceViewModel()
    
    // MARK: - Varibles de entrada
    var name: String? = nil
    var address: String? = nil
    var rating: String? = nil
    var useRatingTotal: String? = nil
    var photo: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
        setUpTable()
    }
    
    func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configure() {
        placeViewModel.getPlaces()
    }
    
    func bind() {
        placeViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ExploreViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeViewModel.arrayResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExplore", for: indexPath) as! ExploreTableViewCell
        
        let object = placeViewModel.arrayResults[indexPath.row]
        
        cell.lblTitle.text = object.name
        cell.lblAddrees.text = object.address
        cell.lblPrice.text = "$141.00"
        cell.lblRating.text = String(object.rating)
        cell.lblCountRating.text = "(\(object.userRatingsTotal))"
        
        let urlImage = URL(string: object.photo)
    
        let data = try? Data(contentsOf: urlImage!)
        
        if let imageData = data {
            cell.exploreImage?.image = UIImage(data: imageData)
        }
        
        let cellView = UIView()
        cellView.backgroundColor = UIColor.systemBackground
        cell.selectedBackgroundView = cellView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Esta funcion captura el click de cada celda
        // sender es lo que se envia
        let object = placeViewModel.arrayResults[indexPath.row]
        // rellenando variables
        self.name = object.name
        self.address = object.address
        self.photo = object.photo
        self.rating = String(object.rating)
        self.useRatingTotal = "(\(object.userRatingsTotal)) Reviews"
        
        performSegue(withIdentifier: "exploreDetail", sender: self)
    }
    
    // prepare es un observador de lo segue, este captura cuando se usa el performSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exploreDetail" {
            if let nextVC = segue.destination as? ExploreDetailViewController {
                nextVC.name = self.name
                nextVC.address = self.address
                nextVC.rating = self.rating
                nextVC.useRatingTotal = self.useRatingTotal
                nextVC.photo = self.photo
            }
        }
    }
}
