//
//  LMTHomeViewController.swift
//  Triply
//
//  Created by Jonanthan Lam on 4/9/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UIKit

class LMTHomeViewController: UIViewController {
    
    private let viewModel: LMTHomeViewModel
    private let tableView: LMTTableView
    
    init(viewModel: LMTHomeViewModel) {
        self.viewModel = viewModel
        
        let tableView = LMTTableView(frame: .zero)
        tableView.estimatedRowHeight = LMTTripTableViewCell.fixedHeight
        tableView.separatorStyle = .none
        
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .red
        tableView.register(LMTTripTableViewCell.self, forCellReuseIdentifier: LMTTripTableViewCell.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        constructTableView()
    }
    
    private func constructTableView() {
        view.addSubview(tableView)
        let layoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getTrips()
    }
    
    // MARK: - Navigation
    func showTripViewController(with viewModel: LMTTripViewModel) {
        let viewController = LMTTripViewController(viewModel: viewModel)
        show(viewController, sender: self)
    }
}

extension LMTHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LMTTripTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! LMTTripTableViewCell
        let cellViewModel = viewModel.getCellViewModel(at: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.getCellViewModel(at: indexPath)
        let tripViewModel = viewModel.getTripViewModel(for: cellViewModel)
        showTripViewController(with: tripViewModel)
    }
}
