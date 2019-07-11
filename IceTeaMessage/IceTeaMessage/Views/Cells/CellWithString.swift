//
//  CellWithString.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class CellWithString: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configView(content: String) {
        contentLabel.text = content
    }

}
