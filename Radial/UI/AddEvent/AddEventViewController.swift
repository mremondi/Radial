//
//  AddEventViewController.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class AddEventViewController: UIViewController{
    
    typealias AddEventNavigation = HomeNavigator
    let navigator: AddEventNavigation!
    let addEventView: AddEventView!
    let interactor: AddEventInteractor!
    
    init(navigator: AddEventNavigation, view: AddEventView, interactor: AddEventInteractor) {
        self.navigator = navigator
        self.addEventView = view
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(addEventView)
        self.addEventView.fillSuperview()
        
        navigationItem.title = "Add Event"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
    }
    
    @objc func cancelTapped(){
        navigator.back()
    }
    
    @objc func doneTapped(){
        if self.addEventView.getEventData().count == 4{
            interactor.createEvent(eventData: self.addEventView.getEventData())
            navigator.toHomeViewController()
        }
    }
}
