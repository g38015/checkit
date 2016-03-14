//
//  LandingViewController.swift
//  Checkit-iOS
//
//  Created by Peter Hitchcock on 3/13/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var findCheckButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        findCheckButton.layer.borderColor = UIColor.whiteColor().CGColor
        findCheckButton.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
