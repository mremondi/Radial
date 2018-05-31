//
//  File.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class MainNavigator: Navigator{
    
    fileprivate var navigationController: UINavigationController?
    
    public var rootViewController: UIViewController {
        return navigationController!
    }
    
    typealias Factory = ViewControllerFactory
    fileprivate let factory: Factory
    
    init(factory: Factory, dismiss: @escaping () -> Void){
        self.factory = factory
        self.navigationController = UINavigationController()
        toHomeViewController()
    }
    
    func back() {
        navigationController?.popViewController(animated: true)
    }
}

extension MainNavigator: HomeNavigator{
    func toHomeViewController() {
        let homeVC = factory.makeHomeViewController(navigator: self)
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

extension MainNavigator: AddEventNavigator{
    func toAddEventViewController() {
        let addEventVC = factory.makeAddEventViewController(navigator: self)
        navigationController?.pushViewController(addEventVC, animated: true)
    }
}
