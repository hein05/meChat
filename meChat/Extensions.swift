//
//  Extensions.swift
//  meChat
//
//  Created by Hein Soe on 10/6/18.
//  Copyright © 2018 Hein Soe. All rights reserved.
//

import UIKit
import Parse

extension UIViewController {
    
    func fieldAlert (title: String, message: String) {

        let showAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        showAlert.addAction(dismissAction)
        self.present(showAlert, animated: true, completion: nil)
    }
    
    func fetchPosts (success: @escaping (_ postArray : [PFObject]) -> ()) {
        let query  = PFQuery(className: "Message")
        query.addDescendingOrder("createdAt")
        query.includeKey("user")
//      query.includeKey("author")
        query.limit = 100
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts, error) in
            if let posts = posts {
                print(posts)
                success(posts)
            } else if (posts?.isEmpty)! {
            }
            else if error != nil {
                print("ERROR INSIDE FETCHED POST \(error?.localizedDescription)")
            }
        }
    }
}
