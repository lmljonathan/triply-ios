//
//  LMTTripViewModel.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/11/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import TriplyServiceKit

class LMTTripViewModel {
    
    var reloadTableViewClosure: (() -> Void)?
    
    public var tripTitle: String = ""
    
    public var backgroundImage: UIImage {
        return UIImage(named: "sample-japan")!
    }
    
    public var numberOfCells: Int {
        return cellViewModels.count
    }
    
    public func getCellViewModel(at indexPath: IndexPath) -> LMTPlaceCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    private var cellViewModels: [LMTPlaceCellViewModel] = [] {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    private var places: [LMTPlace] = [] {
        didSet {
            
        }
    }
    
    init(tripTitle: String) {
        self.tripTitle = tripTitle
    }
}
