//
//  AppNavigator.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

final class AppNavigator: Navigator{
    
    typealias Factory = ViewControllerFactory
    fileprivate let factory: Factory
    
    init(factory: Factory){
        self.factory = factory
    }
    
    func run(window: UIWindow?){
        // include any routing here. E.g. if !loggedIn -> goToLoginFlow()
        goToMainApp(window: window)
    }
    
    private func goToMainApp(window: UIWindow?){
        // Any type of Navigator can go here. E.g. a TabBarNavigator with sub-navigators children for each tab
        let mainNavigator = MainNavigator(factory: factory, dismiss: { () in
            // include dismissal logic here. use this to switch between navigation flows
        })
        window?.rootViewController = mainNavigator.rootViewController
        window?.makeKeyAndVisible()
    }
    
    func back() {
        //
    }
}
