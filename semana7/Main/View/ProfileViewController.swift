//
//  ProfileViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 19/10/21.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        imageProfile.layer.cornerRadius = imageProfile.frame.size.height / 2
        imageProfile.layer.borderWidth = 1
        imageProfile.layer.masksToBounds = true
    }
    
    func getUser() {
        let user = Auth.auth().currentUser
        lblEmail.text = user?.email!
        lblName.text = user?.displayName!
        
        let imageData = try? Data(contentsOf: (user?.photoURL!)!)
        
        if let data = imageData {
            imageProfile.image = UIImage(data: data)
        }
    }
    
    @IBAction func onClickLogout(_ sender: Any) {
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
