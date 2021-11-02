//
//  util.swift
//  semana7
//
//  Created by Linder Hassinger on 2/11/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - SetUpImage
    func setUpImage(photo: String, image: UIImageView) {
        let urlImage = URL(string: photo)
        
        let imageData = try? Data(contentsOf: urlImage!)
        
        if let data = imageData {
            image.image = UIImage(data: data)
        }
    }
    
}
