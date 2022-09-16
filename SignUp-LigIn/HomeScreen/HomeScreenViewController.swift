//
//  HomeScreenViewController.swift
//  SignUp-LigIn
//
//  Created by Mahdi Fabio on 28/07/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        try! FirebaseAuth.Auth.auth().signOut()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyboard.instantiateViewController(identifier:  Constants.Storyboard.Home) as? ViewController

//        Home.modalPresentationStyle = .fullScreen
        self.view.window?.rootViewController = Home
        self.view.window?.makeKeyAndVisible()
//
//                if let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "Home") as? ViewController {
//                    vc.modalPresentationStyle = .fullScreen
//                    present(vc, animated: true, completion: nil)
    //}
    
    }
}
