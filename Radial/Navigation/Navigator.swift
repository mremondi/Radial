//
//  Navigator.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

protocol Navigator{
    func back()
}

protocol HomeNavigator: Navigator {
    func toHomeViewController()
}

protocol AddEventNavigator: Navigator {
    func toAddEventViewController()
}
