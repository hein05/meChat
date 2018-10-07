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
    
    func emptyFieldAlert () {

        let showAlert = UIAlertController(title: "Empty Field", message: "All fields must be filled in", preferredStyle: .alert)
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
                print(">>>>>>>>>> More Posts")
                print(posts)
                success(posts)
            } else if (posts?.isEmpty)! {
                print(">>>>>>>>>> No More Posts")
            }
            else if error != nil {
                print("ERROR INSIDE FETCHED POST \(error?.localizedDescription)")
            }
        }
    }
}
