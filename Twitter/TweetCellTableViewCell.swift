//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Ruchika Gupta on 10/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileImageView: UIImageView!
    
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    
    @IBOutlet weak var TweetContentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
