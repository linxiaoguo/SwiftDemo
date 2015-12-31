//
//  StockListCell.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/30.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit

class StockListCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblPrice: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
