//
//  LMTPlaceCellViewModel.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/29/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit
import TriplyServiceKit

class LMTPlaceCellViewModel {
    
    var nameText: String
    var backgroundImage: Observable<UIImage>
    
    init(place: LMTPlace) {
        nameText = place.name
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
