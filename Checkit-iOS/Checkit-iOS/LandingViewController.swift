//
//  LandingViewController.swift
//  Checkit-iOS
//
//  Created by Peter Hitchcock on 3/13/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import ExpandingMenu

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureExpandingMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func configureExpandingMenuButton() {
        let menuButtonSize: CGSize = CGSize(width: 70.0, height: 70.0)
        let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPointZero, size: menuButtonSize), centerImage: UIImage(named: "chooser-button-tab")!, centerHighlightedImage: UIImage(named: "chooser-button-tab-highlighted")!)
        menuButton.center = CGPointMake(self.view.bounds.width - 32.0, self.view.bounds.height - 72.0)
        self.view.addSubview(menuButton)


        let item1 = ExpandingMenuItem(size: menuButtonSize, title: "Search Checks", image: UIImage(named: "chooser-moment-icon-music")!, highlightedImage: UIImage(named: "chooser-moment-icon-place-highlighted")!, backgroundImage: UIImage(named: "chooser-moment-button"), backgroundHighlightedImage: UIImage(named: "chooser-moment-button-highlighted")) { () -> Void in
            self.performSegueWithIdentifier("checksSegue", sender: self)
        }

        let item2 = ExpandingMenuItem(size: menuButtonSize, title: "Info", image: UIImage(named: "chooser-moment-icon-place")!, highlightedImage: UIImage(named: "chooser-moment-icon-place-highlighted")!, backgroundImage: UIImage(named: "chooser-moment-button"), backgroundHighlightedImage: UIImage(named: "chooser-moment-button-highlighted")) { () -> Void in
            self.performSegueWithIdentifier("infoSegue", sender: self)
        }

        menuButton.addMenuItems([item1, item2])

        menuButton.willPresentMenuItems = { (menu) -> Void in
            print("MenuItems will present.")
        }

        menuButton.didDismissMenuItems = { (menu) -> Void in
            print("MenuItems dismissed.")
        }
    }

}
