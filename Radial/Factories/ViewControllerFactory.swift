//
//  ViewControllerFactory.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

protocol ViewControllerFactory{
    func makeHomeViewController(navigator: Navigator) -> HomeViewController
    func makeAddEventViewController(navigator: Navigator) -> AddEventViewController
}
