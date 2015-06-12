//
//  MainViewCell.swift
//  UniChat
//
//  Created by Denzel Carter on 6/12/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    @IBOutlet var usernameTxt: UILabel!
    
    @IBOutlet var messageTxt: UILabel!
    
    @IBOutlet var imageTxt: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
