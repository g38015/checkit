//
//  InfoTableViewController.swift
//  Checkit-iOS
//
//  Created by Peter Hitchcock on 3/22/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Base"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
