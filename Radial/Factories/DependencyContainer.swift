//
//  DependencyContainer.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
class DependencyContainer {
    
}

extension DependencyContainer: ViewControllerFactory{
    func makeHomeViewController(navigator: Navigator) -> HomeViewController {
        return HomeViewController(navigator: navigator as! HomeViewController.HomeNavigation, view: HomeView(), interactor: HomeInteractor())
    }
    
    func makeAddEventViewController(navigator: Navigator) -> AddEventViewController {
        return AddEventViewController(navigator: navigator as! AddEventViewController.AddEventNavigation, view: AddEventView(), interactor: AddEventInteractor())
    }
}
