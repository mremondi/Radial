//
//  ClockView.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class ClockView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        drawCircle()
    }
    
    private func drawCircle(){
        let width = bounds.width
        let height = bounds.height
        let centerPoint = CGPoint(x: width/2, y: height/2)
        let radius = CGFloat(100)
        let circleBox = CGRect(x: centerPoint.x - radius, y: centerPoint.y - radius, width: radius*2, height: radius*2)
        
        let path = UIBezierPath(ovalIn: circleBox)
        UIColor.white.setFill()
        path.fill()
        path.stroke()
    }
}
