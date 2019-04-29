//
//  LMTTripViewModel.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/11/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit

class LMTTripViewModel {
    
    public var tripTitle: String = ""
    
    public var backgroundImage: UIImage {
        return UIImage(named: "sample-japan")!
    }
    
    init(tripTitle: String) {
        self.tripTitle = tripTitle
    }
}
