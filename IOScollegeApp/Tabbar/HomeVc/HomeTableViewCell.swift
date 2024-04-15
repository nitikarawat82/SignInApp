//
//  HomeTableViewCell.swift
//  IOScollegeApp
//
//  Created by HT-Mac-06 on 4/10/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var HomeEmailLbl: UILabel!
    @IBOutlet weak var HomePhoneLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
