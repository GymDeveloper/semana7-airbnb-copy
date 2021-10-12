//
//  CheckDateViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 12/10/21.
//

import UIKit

class CheckDateViewController: UIViewController {

    @IBOutlet weak var calendarPicker: UIDatePicker!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        backButton.setImage(UIImage(named: "cancel"), for: .normal)
        backButton.setTitle("", for: .normal)
    }
    
    @IBAction func onClickCalendar(_ sender: Any) {
        // primero tengo que darle un formato a la fecha
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        lblDate.text = formatter.string(from: calendarPicker.date)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
