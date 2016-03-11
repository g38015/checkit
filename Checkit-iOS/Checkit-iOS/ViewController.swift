//
//  ViewController.swift
//  Checkit-iOS
//
//  Created by Peter Hitchcock on 3/10/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var checks = [Check]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchForChecks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchForChecks() {
        Alamofire.request(.GET, "https://sac-checkit.herokuapp.com/api/v1/checks?utf8=%E2%9C%93&filterrific%5Bsearch_query%5D=peter")
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization

                if let JSON = response.result.value {

                    let dict = JSON
                    let ar = dict["checks"] as! [AnyObject]
                    self.checks.removeAll()
                    for a in ar {

                        var name = ""
                        var date = ""
                        var amount = ""
                        var number = ""

                        if let nameJson = a["name"] {
                            name = nameJson as! String
                        }

                        if let dateJson = a["date"] {
                            date = dateJson as! String
                        }

                        if let amountJson = a["amount"] {
                            amount = amountJson as! String
                        }

                        if let numberJson = a["number"] {
                            number = numberJson as! String
                        }

                        let check = Check(name: name, number: number, amount: amount, date: date)

                        self.checks.append(check)

                    }
                }
                self.tableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checks.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = checks[indexPath.row].name
        return cell
    }
}


