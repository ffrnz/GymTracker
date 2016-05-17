//
//  TraingsPlanTableViewCell.swift
//  GymTracker
//
//  Created by Florian M. on 14/05/16.
//  Copyright © 2016 Florian M. All rights reserved.
//

import UIKit

class TraingsPlanTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var tagLabel: UILabel!
    
    @IBOutlet weak var tagDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
