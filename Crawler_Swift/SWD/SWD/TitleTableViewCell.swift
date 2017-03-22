//
//  TitleTableViewCell.swift
//  SWD
//
//  Created by Anh Tuan on 3/1/17.
//  Copyright © 2017 Anh Tuan. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(str : String) {
        self.lblTitle.text = str
    }
    
}
