//
//  ChatTableViewCell.swift
//  meChat
//
//  Created by Hein Soe on 10/6/18.
//  Copyright © 2018 Hein Soe. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var bubble: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bubble.layer.cornerRadius = 16
        bubble.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
