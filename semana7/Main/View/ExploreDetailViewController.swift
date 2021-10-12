//
//  ExploreDetailViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 12/10/21.
//

import UIKit

class ExploreDetailViewController: UIViewController {
    
    // MARK: - Varibles de entrada
    var name: String? = nil
    var address: String? = nil
    var rating: String? = nil
    var useRatingTotal: String? = nil
    var photo: String? = nil
    
    // MARK: - Variable de mi vista
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var location: UIButton!
    @IBOutlet weak var message: UIButton!
    @IBOutlet weak var changeDate: UIButton!
    @IBOutlet weak var lblRevies: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpImage()
        setUpButtons()
    }
   
    // MARK: - SetUpView
    func setUpView() {
        lblName.text = name!
        lblAddress.text = address!
        lblRating.text = rating!
        lblRevies.text = useRatingTotal!
    }
    
    // MARK: - SetUpButton
    func setUpButtons() {
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.setTitle("", for: .normal)
        location.setTitle("", for: .normal)
        message.setTitle("", for: .normal)
        changeDate.layer.cornerRadius = 8
        changeDate.layer.masksToBounds = true
    }
    
    // MARK: - SetUpImage
    func setUpImage() {
        let urlImage = URL(string: photo!)
        
        let imageData = try? Data(contentsOf: urlImage!)
        
        if let data = imageData {
            image.image = UIImage(data: data)
        }
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
