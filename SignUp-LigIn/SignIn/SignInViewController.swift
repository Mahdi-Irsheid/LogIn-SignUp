//
//  SignInViewController.swift
//  SignUp-LigIn
//
//  Created by Mahdi Fabio on 28/07/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var EmailUserTextField: UITextField!
    
    @IBOutlet weak var PasswordUserTextField: UITextField!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBOutlet weak var ErrorLable: UILabel!
    @IBOutlet weak var forgetPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignInButton.layer.cornerRadius = 25
        
        setupTest()

    }
    
    private func setupTest(){
        EmailUserTextField.text = "test01@gmail.com"
        PasswordUserTextField.text = "test01"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
    }
    
    func setUpElements() {
        
        // Hide the error label
        // Style the elements
//        Utilities.styleTextField(emailTextField)
//        Utilities.styleTextField(passwordTextField)
//        Utilities.styleFilledButton(loginButton)
        
    }
    func validateFields() ->String?{
        if EmailUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."

        }
        
        return  nil
    }
    
    @IBAction func forgetPasswordPressed(_ sender: Any) {
    
    }
    @IBAction func SignInPressed(_ sender: Any) {
        
        let email = EmailUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            /*if error != nil{
             let alert = Constants.createAlertController(title: "Error", message: "There was an error in email field, check your email spilling, or this email does'nt exist.")
             self.present(alert, animated: true, completion: nil)
             return
         }
         let alert = Constants.createAlertController(title: "Success", message: "A password reset email has been sent to your email.")
         self.present(alert, animated: true, completion: nil)
             */
            if error != nil{
                let alert = Constants.createAlertController(title: "Error", message: "There's something wrong with the fields, try to fill in the fields correctly.")
                self.present(alert, animated: true, completion: nil)
                return
            }
            else {
                let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
                let home = storyboard.instantiateViewController(identifier: Constants.Storyboard.home) as? HomeScreenViewController
                
                self.view.window?.rootViewController = home
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    


}
