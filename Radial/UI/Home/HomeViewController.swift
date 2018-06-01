//
//  HomeViewController.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    typealias HomeNavigation = AddEventNavigator
    let navigator: HomeNavigation!
    let homeView: HomeView!
    let interactor: HomeInteractor!
    
    var events: [EventModel] = []
    
    init(navigator: HomeNavigation, view: HomeView, interactor: HomeInteractor) {
        self.navigator = navigator
        self.homeView = view
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(homeView)
        self.homeView.fillSuperview()
        homeView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Event", style: .plain, target: self, action: #selector(addTapped))
        
        // get today's events
        homeView.configureView(events: interactor.getEvents(for: Date()))
    }
    
    @objc func addTapped(){
        navigator.toAddEventViewController()
    }
}

extension HomeViewController: HomeViewDelegate{
    func newDateSelected(date: Date) {
        homeView.configureView(events: interactor.getEvents(for: date))
    }
}
