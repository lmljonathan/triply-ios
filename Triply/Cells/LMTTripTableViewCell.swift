//
//  LMTTripTableViewCell.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/9/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit

class LMTTripTableViewCell: UITableViewCell {
    static var reuseIdentifier: String { return "LMTTripTableViewCell" }
    static var fixedHeight: CGFloat { return 150.0 }
    
    var containerView: TripContainerView!
    var backgroundImageView: TripBackgroundImageView!
    var nameLabel: TripNameLabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        containerView = TripContainerView(frame: .zero)
        backgroundImageView = TripBackgroundImageView(frame: .zero)
        nameLabel = TripNameLabel(frame: .zero)

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        selectionStyle = .none
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 12.0
        
        backgroundImageView.alpha = 0.8
        
        containerView.addSubview(backgroundImageView)
        containerView.addSubview(nameLabel)
        contentView.addSubview(containerView)
        
        layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let layoutGuide = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            containerView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -14.0),
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 14.0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: LMTTripCellViewModel) {
        nameLabel.text = viewModel.nameText
        backgroundImageView.image = viewModel.backgroundImage.value
        viewModel.backgroundImage.valueChanged = {
            [weak self] image in
            self?.backgroundImageView.image = image
        }
    }
}

extension LMTTripTableViewCell {
    class TripContainerView: LMTView {
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class TripBackgroundImageView: UIImageView {
        override init(frame: CGRect) {
            super.init(frame: frame)
            translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class TripNameLabel: UILabel {
        override init(frame: CGRect) {
            super.init(frame: frame)
            font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}
