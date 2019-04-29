//
//  LMTTripViewController.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/9/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit

class LMTTripViewController: UIViewController {
    
    var topHeaderView: TripHeaderView
    var tableView: LMTTableView
    var viewModel: LMTTripViewModel
    
    init(viewModel: LMTTripViewModel) {
        self.viewModel = viewModel
        topHeaderView = TripHeaderView(frame: .zero)
        topHeaderView.backgroundImageView.image = viewModel.backgroundImage
        topHeaderView.titleLabel.text = viewModel.tripTitle
        tableView = LMTTableView(frame: .zero)
        
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(topHeaderView)
        view.addSubview(tableView)
        
        let layoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            topHeaderView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            topHeaderView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            topHeaderView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            topHeaderView.heightAnchor.constraint(equalToConstant: 250.0),
            
            tableView.topAnchor.constraint(equalTo: topHeaderView.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension LMTTripViewController {
    class TripHeaderView: LMTView {
        var backgroundImageView: LMTImageView
        var titleLabel: LMTLabel
        
        override init(frame: CGRect) {
            backgroundImageView = LMTImageView(frame: .zero)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.alpha = 0.8
            titleLabel = LMTLabel(frame: .zero)
            titleLabel.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
            
            super.init(frame: frame)
            
            addSubview(backgroundImageView)
            addSubview(titleLabel)
            
            let layoutGuide = safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                backgroundImageView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
                backgroundImageView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
                backgroundImageView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
                
                titleLabel.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -14.0),
                titleLabel.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: 20.0),
                ])
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
