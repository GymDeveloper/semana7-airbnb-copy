//
//  ProfileViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 19/10/21.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var lblEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        // Do any additional setup after loading the view.
    }
    
    func getUser() {
        let user = Auth.auth().currentUser
        lblEmail.text = user?.email!
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
