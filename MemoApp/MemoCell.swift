//
//  MemoCell.swift
//  MemoApp
//
//  Created by JHJG on 2016. 4. 3..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
