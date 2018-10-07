//
//  HomeViewController.swift
//  meChat
//
//  Created by Hein Soe on 10/6/18.
//  Copyright © 2018 Hein Soe. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let chatMessage = PFObject(className: "Message")
    
    var messageArray : [PFObject] = []
    
    @IBOutlet weak var chatMessageField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chatMessage["text"] = chatMessageField.text ?? ""
        
        tableView.delegate = self
        tableView.dataSource = self as UITableViewDataSource
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.separatorStyle = .none
        
        self.tableView.reloadData()
        self.fetchPosts { (fetchedposts) in
            for post in fetchedposts {
                self.messageArray.append(post)
            }
            self.tableView.reloadData()
        }
//        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func clickedLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            // PFUser.current() will now be nil
            if let error = error {
                print("There is error in Logging Out\(error.localizedDescription)")
            } else {
                print("Logout successfully")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func clickedSend(_ sender: Any) {
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func onTimer () {
        print("=================== ON Timer =======================")
        self.fetchPosts { (fetchedposts) in
            for post in fetchedposts {
                self.messageArray.append(post)
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(messageArray.count)
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatTableViewCell
        cell.message.text = messageArray[indexPath.row]["text"] as? String
        if let user = messageArray[indexPath.row]["user"] as? PFUser {
            // User found! update username label with username
            cell.user.text = user.username
        } else {
            // No user found, set default username
            cell.user.text = "🤖"
        }
//        cell.message.text = "This is changed Text Testing fa;lsdfkashdasdbcjsadkl;fhjkasdfhjhasdklfasdfjklasdkjhfas;dlfjaklsfdklasjdfl"
        return cell
    }
}
