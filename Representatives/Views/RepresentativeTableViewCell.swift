//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Zachary Frew on 7/18/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    // MARK: - Properties
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    func updateViews() {
        guard let representative = representative else { return }
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        phoneNumberLabel.text = representative.phone
    }

}
