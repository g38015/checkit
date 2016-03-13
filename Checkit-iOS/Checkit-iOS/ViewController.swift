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
    var searchActive = false
    var filtered = [Check]()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage()

        searchBar.setBackgroundImage(image, forBarPosition: .Any, barMetrics: .Default)
        searchBar.scopeBarBackgroundImage = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func searchForChecks(search: String) {
        Alamofire.request(.GET, "https://sac-checkit.herokuapp.com/api/v1/checks?utf8=%E2%9C%93&filterrific%5Bsearch_query%5D=\(search)")
            .responseJSON { response in

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

                        let check = Check(name: name.lowercaseString.capitalizedString, number: number, amount: amount, date: date)

                        self.checks.append(check)

                    }
                }
                self.tableView.reloadData()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSegue" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let dvc = segue.destinationViewController as! CheckViewController
                dvc.check = checks[row]
            }
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
        cell.detailTextLabel?.text = checks[indexPath.row].amount
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

        searchForChecks(searchText.removeWhitespace())
        
        if checks.count == 0 {
            searchActive = false
        } else {
            searchActive = true
        }
        self.tableView.reloadData()
    }

}
