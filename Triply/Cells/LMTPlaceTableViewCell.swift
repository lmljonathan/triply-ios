//
//  LMTPlaceTableViewCell.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/29/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit

class LMTPlaceTableViewCell: UITableViewCell {
    static var reuseIdentifier: String { return "LMTPlaceTableViewCell" }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: LMTPlaceCellViewModel) {
        
    }
}
