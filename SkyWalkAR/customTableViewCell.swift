//
//  customTableViewCell.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 31/03/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var xlab: UILabel!
    @IBOutlet weak var ylab: UILabel!
    @IBOutlet weak var zlab: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
