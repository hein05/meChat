//
//  SignupViewController.swift
//  meChat
//
//  Created by Hein Soe on 10/6/18.
//  Copyright © 2018 Hein Soe. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.email = emailField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                print(" >>>>>>>>>>>> User Registered successfully")
                // manually segue to logged in view
            }
        }
    }
    
    @IBAction func clicksignUp(_ sender: Any) {
        if (usernameField!.text == "") || (passwordField!.text == "") || (emailField!.text == "") {
            self.fieldAlert(title: "Empty Field", message: "All Field must be filled in")
        } else {
            self.registerUser()
            self.dismiss(animated: true, completion: nil)
        }
    }
        
    
    
}
