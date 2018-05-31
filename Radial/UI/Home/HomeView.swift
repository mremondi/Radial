//
//  HomeView.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView{
    var clockView: ClockView!
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = StyleKit.Colors.clockBackground
        initViews()
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        clockView = ClockView()
        
        [clockView].forEach{
            addSubview($0)
        }
    }
    
    func initConstraints(){
        clockView.anchorCenter(to: self)
        clockView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 300, height: 300))
    }
}
