//
//  CheckTableViewCell.swift
//  Checkit-iOS
//
//  Created by Peter Hitchcock on 4/4/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class CheckTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
