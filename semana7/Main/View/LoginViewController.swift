//
//  LoginViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 19/10/21.
//

import UIKit
//Pasa 1 importar FirebaseAuth
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    // Segun el ciclo de vida viewDidLoad se ejecuta despues de renderizar
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // para que aca vaya a otra vista debo viewDidApper
    // viewDidApper es la funcion que renderiza lo elementos y se ejecuta antes del viewDidLoad
    override func viewDidAppear(_ animated: Bool) {
        validateSession()
    }

    @IBAction func onClickLogin(_ sender: Any) {
//         Paso 2 obtener el texto de los inputs email y password
        let email = txtEmail.text!
        let password = txtPassword.text!
        
//        Paso 3 Invocar a la funcion createUser de Firebase
//        Esto sirve para crear un usuario
//        createUser(email: email, password: password)
        loginUser(email: email, password: password)
    }
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            authResponse, error in
            
            if error == nil {
//                Todo ok que vaya a la vista del main
                self.goMain()
            }
        }
    }
    
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResponse, error in
            
            if error == nil {
                self.goMain()
            }
        }
    }
    
    func validateSession() {
        if Auth.auth().currentUser != nil {
            // La session existe
            self.goMain()
        }
    }
    
    func goMain() {
        self.performSegue(withIdentifier: "segueLogin", sender: nil)
    }
}
