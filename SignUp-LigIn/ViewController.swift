//
//  ViewController.swift
//  SignUp-LigIn
//
//  Created by Mahdi Fabio on 28/07/2022.
//

import UIKit
import Firebase
import FirebaseCore



class ViewController: UIViewController {

    @IBOutlet weak var SignUpBotton: UIButton!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBOutlet weak var rcLable: UILabel!
    
    override func viewDidLoad() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        super.viewDidLoad()
        SignUpBotton.layer.cornerRadius = 25
        SignInButton.layer.cornerRadius = 25
        
        setupRemoteConfigDefaults()
        displayNewValues()
        fetchRemoteConfig()
        
    }
    
    func setupRemoteConfigDefaults() {
        let defaultValue = ["lable_text": "Hello World" as NSObject]
    remoteConfig.setDefaults(defaultValue)
    }
    
    
    func fetchRemoteConfig(){
    remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
    guard error == nil else { return }
    print("Got the value from Remote Config!")
    remoteConfig.activate()
    self.displayNewValues()
    }}
    func displayNewValues(){
            let newLabelText = remoteConfig.configValue(forKey: "lable_text").stringValue ?? ""
            rcLable.text = newLabelText
    }

}

