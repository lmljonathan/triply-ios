//
//  LMTTripListService.swift
//  TriplyServiceKit
//
//  Created by Jonanthan Lam on 4/11/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import Foundation
import LMTRequestKit

public protocol LMTTripListServiceDelegate: class {
    func tripListService(_ service: LMTTripListService, didGetTrips trips: [LMTTrip])
}

public class LMTTripListService {
    
    public var delegate: LMTTripListServiceDelegate?
    
    public init() {
        
    }
    
    public func getTrips(from url: String) {
        let trip1 = LMTTrip(name: "Japan", imageURL: "")
        let trip2 = LMTTrip(name: "Paris", imageURL: "")
        let trip3 = LMTTrip(name: "France", imageURL: "")
        let trip4 = LMTTrip(name: "Germany", imageURL: "")
        let trip5 = LMTTrip(name: "San Leon", imageURL: "")
        delegate?.tripListService(self, didGetTrips: [trip1, trip2, trip3, trip4, trip5])
    }

}
