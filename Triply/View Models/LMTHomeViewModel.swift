//
//  LMTHomeViewModel.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/9/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit
import TriplyServiceKit

class LMTHomeViewModel {
    
    var reloadTableViewClosure: (() -> Void)?
    var loadingStatusDidUpdate: (() -> Void)?
    
    public var isLoading: Bool = false {
        didSet {
            self.loadingStatusDidUpdate?()
        }
    }
    
    public var numberOfCells: Int {
        return cellViewModels.count
    }
    
    public func getCellViewModel(at indexPath: IndexPath) -> LMTTripCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    private var cellViewModels: [LMTTripCellViewModel] = [] {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    private var trips: [LMTTrip] = [] {
        didSet {
            cellViewModels = trips.map{ LMTTripCellViewModel(trip: $0) }
        }
    }
    
    private let tripListService: LMTTripListService
    
    
    // MARK: - Methods
    init() {
        tripListService = LMTTripListService()
        tripListService.delegate = self
    }
    
    public func getTripViewModel(for cellViewModel: LMTTripCellViewModel) -> LMTTripViewModel {
        let viewModel = LMTTripViewModel(tripTitle: cellViewModel.nameText)
        return viewModel
    }
    
    public func getTrips() {
        tripListService.getTrips(from: "")
    }
}

extension LMTHomeViewModel: LMTTripListServiceDelegate {
    func tripListService(_ service: LMTTripListService, didGetTrips trips: [LMTTrip]) {
        self.trips = trips
    }
}


