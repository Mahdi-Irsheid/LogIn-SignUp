import Foundation
import UIKit

struct Constants {
    
    struct Storyboard {
        
        static let home = "HomeVC"
        static let Home = "Home"
    }
    static func createAlertController(title: String, message: String) -> UIAlertController {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
               alert.dismiss(animated: true, completion: nil)
           }
           
           alert.addAction(okAction)
           
           return alert
       }
}
