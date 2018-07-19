//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Zachary Frew on 7/18/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            representativeController.searchRepresentatives(forState: state) { (representatives) in
                self.representatives = representatives
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }

    // MARK: - Properties
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?
    
    let representativeController = RepresentativeController()
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }
        let representative = representatives[indexPath.row]
        cell.representative = representative
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
