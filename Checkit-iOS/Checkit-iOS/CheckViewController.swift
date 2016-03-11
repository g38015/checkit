//
//  CheckViewController.swift
//  Checkit-iOS
//
//  Created by Peter Hitchcock on 3/11/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {

    var check: Check?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var checkNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if check != nil {
            nameLabel.text = check!.name
            amountLabel.text = check!.amount
            checkNumberLabel.text = check!.number
            dateLabel.text = check!.date
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
