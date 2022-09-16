//
//  forgetPasswordVC.swift
//  SignUp-LigIn
//
//  Created by Mahdi Fabio on 11/08/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftUI
class forgetPasswordVC: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var sendForgottenPassword: UIButton!
    @IBOutlet weak var errorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func validateFields() ->String?{
        if EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."

        }
        
        return  nil
    }
    @IBAction func sendForgottenPasswordPressed(_ sender: Any) {
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().sendPasswordReset(withEmail: email) {error in
            if error != nil{
                let alert = Constants.createAlertController(title: "Error", message: "There was an error in email field, check your email spilling, or this email does'nt exist.")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = Constants.createAlertController(title: "Success", message: "A password reset email has been sent to your email.")
            self.present(alert, animated: true, completion: nil)

            //if let vc = UIStoryboard.init(name: "forgetPasswordVC", bundle: nil).instantiateViewController(identifier: "SignInViewController") as? SignInViewController {
//    //            vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//            }
            
        }
        
    }
           
     
}
