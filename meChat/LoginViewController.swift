//
//  ViewController.swift
//  meChat
//
//  Created by Hein Soe on 10/2/18.
//  Copyright © 2018 Hein Soe. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginUser() {
        
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            
            if let error = error {
//                print("User log in failed: \(error.localizedDescription)")
                self.fieldAlert(title: "Error", message: "User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "gohome", sender: nil)
            }
        }
    }
    
    @IBAction func clickedLogin(_ sender: Any) {
        self.loginUser()
    }
}

