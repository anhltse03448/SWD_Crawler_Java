//
//  Header.swift
//  SWD
//
//  Created by Anh Tuan on 3/1/17.
//  Copyright © 2017 Anh Tuan. All rights reserved.
//

import UIKit

class Header: UIView {
    @IBOutlet weak var lbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(str : String) {
        self.lbl.text = str
    }
}
