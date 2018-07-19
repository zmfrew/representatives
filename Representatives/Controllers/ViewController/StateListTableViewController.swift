//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Zachary Frew on 7/18/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        let state = States.all[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? StateDetailTableViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let state = States.all[indexPath.row]
            destinationVC.state = state
            destinationVC.title = state
        }
    }

}
