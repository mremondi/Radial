//
//  StyleKit.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

/// This struct contains style information and tools for the app.
struct StyleKit {
    
    struct Font{
        static let thin = "AppleSDGothicNeo-Thin"
        static let regular = "AppleSDGothicNeo-Regular"
        static let semiBold = "AppleSDGothicNeo-SemiBold"
        static let bold = "AppleSDGothicNeo-Bold"
    }
    
    // Main theme colors for the app
    struct Colors {
        static let clockBackground = UIColor(red: 52/255.0, green: 52/255.0, blue: 52/255.0, alpha: 1.0)
        static let activeBlue = UIColor(red: 118/255.0,green: 190/255.0, blue: 255/255.0, alpha: 1.0)
        static let inActiveBlue = UIColor(red: 173/255.0, green: 214/255.0, blue: 255/255.0, alpha: 1.0)
    }
}
