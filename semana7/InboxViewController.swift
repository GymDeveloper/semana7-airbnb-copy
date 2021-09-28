//
//  InboxViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 28/09/21.
//

import UIKit

class InboxViewController: UIViewController {
    
    let people = ["Jorge Carpena", "Lee Tipismana", "Jamutaq Ortega", "Brayan Blas", "Claudia Ramos", "Richard Mamani", "David Yauri"]
    
    let messages = ["Hola ✌🏻", "Como estas?", "Te espero!!!", "Donde estas?", "IDK?", "La clase ya empezo? 🤖🎃", "Para cuando Tecsup? 🔃"]
    
    let notifacions = ["Nuevo mensaje 📝", "Alerta de seguridad 🚨", "Reunión pendiente"]
    
    let notiDetail = ["Recuerda leerlo", "Verifica tu password", "Empieza en 5 min."]

    // este outlet se encargar de decirme el indice del click
    @IBOutlet weak var segmentOptions: UISegmentedControl!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        print(segmentOptions.selectedSegmentIndex)
    }
    
    func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func onClickSegment(_ sender: Any) {
        tableView.reloadData()
    }
    
}

extension InboxViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmentOptions.selectedSegmentIndex == 0 {
            return people.count
        } else {
            return notifacions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        if segmentOptions.selectedSegmentIndex == 0 {
            cell.textLabel?.text = people[indexPath.row]
            cell.detailTextLabel?.text = messages[indexPath.row]
        } else {
            cell.textLabel?.text = notifacions[indexPath.row]
            cell.detailTextLabel?.text = notiDetail[indexPath.row]
        }
        
        return cell
    }
}
