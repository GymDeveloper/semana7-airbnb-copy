//
//  ExploreTableViewCell.swift
//  semana7
//
//  Created by Linder Hassinger on 5/10/21.
//

import UIKit
import SkeletonView

class ExploreTableViewCell: UITableViewCell {

    // en el viewcell van vinculados los elementos UI
    // de mi vista
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblCountRating: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var exploreImage: UIImageView!
    @IBOutlet weak var lblAddrees: UILabel!
    
    override func awakeFromNib() {
        // este metodo en una celda el igual a viewDidLoad
        super.awakeFromNib()
        exploreImage.layer.cornerRadius = 12
        exploreImage.layer.masksToBounds = true
        exploreImage.isSkeletonable = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
