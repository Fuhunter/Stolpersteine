//
//  PersonsTableViewCell.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class PersonsTableViewCell: UITableViewCell {

    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personName: UILabel!
    @IBOutlet var personStolperSteinLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
