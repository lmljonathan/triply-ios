//
//  LMTTripCellViewModel.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/9/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit
import TriplyServiceKit

class LMTTripCellViewModel {
    
    var nameText: String
    var backgroundImage: Observable<UIImage>
    
    init(trip: LMTTrip) {
        nameText = trip.name
        backgroundImage = Observable(UIImage(named: "sample-japan")!)
//        LMTRequest.getImage(url: trip.imageURL) { (image) in
//            guard let image = image else {
//                self.backgroundImage.value = UIImage(named: "error")!
//                return
//            }
//            self.backgroundImage.value = image
//        }
    }
}
