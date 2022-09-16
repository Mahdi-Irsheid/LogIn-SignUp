

import UIKit
import Firebase
import FirebaseAuth
class SignUpViewController: UIViewController {

    @IBOutlet weak var NameUserTextField: UITextField!
    
    @IBOutlet weak var EmailUserTextField: UITextField!
    
    @IBOutlet weak var PasswordUserTextField: UITextField!
    
    @IBOutlet weak var CompleteSignUpButton: UIButton!
    
    @IBOutlet weak var ErrorLable: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        CompleteSignUpButton.layer.cornerRadius = 25
        ErrorLable.alpha = 0

//        FirebaseApp.configure()
    }
    func validateFields() ->String?{
        if NameUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."

        }
        
        return  nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
    }
    
    @IBAction func SubmetSignUpButton(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            let alert = Constants.createAlertController(title: "Error", message: "There's something wrong with the fields, try to fill in the fields correctly.")
            self.present(alert, animated: true, completion: nil)
            return
        }
        else {
            
            // Create cleaned versions of the data
            let Name = NameUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let  password = PasswordUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    let alert = Constants.createAlertController(title: "Error", message: "Error creating user.")
                    self.present(alert, animated: true, completion: nil)
                    return                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["id":email, "name":Name, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            let alert = Constants.createAlertController(title: "Error", message: "Error saving user data.")
                            self.present(alert, animated: true, completion: nil)
                            return
                        }
                    }
                }
                    // Transition to the home screen
                    self.transitionToHome()
                }
    }
    }
//    func showError(_ message:String) {
//
//        ErrorLable.text = message
//        ErrorLable.alpha = 1
//    }
    func transitionToHome() {
        
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        let home = storyboard.instantiateViewController(identifier: Constants.Storyboard.home) as? HomeScreenViewController

        view.window?.rootViewController = home
        view.window?.makeKeyAndVisible()
        


//        if let vc = UIStoryboard.init(name: "HomeScreen", bundle: nil).instantiateViewController(identifier: "HomeVC") as? HomeScreenViewController {
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: nil)
//        }
//
    }
    }

