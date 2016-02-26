//
//  EventsTableViewCell.swift
//  Stolperwege
//
//  Created by Naffi on 26.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet var eventIcon: UIImageView!
    @IBOutlet var eventDate: UILabel!
    @IBOutlet var eventType: UILabel!
    @IBOutlet var eventLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
