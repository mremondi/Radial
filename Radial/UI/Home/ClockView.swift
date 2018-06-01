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
    
    var events: [EventModel] = []
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func redraw(events: [EventModel]){
        self.events = events
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        drawCircle()
        if (events.count > 0){
            drawEvents()
        }
    }
    
    private func drawCircle(){
        let width = bounds.width
        let height = bounds.height
        let centerPoint = CGPoint(x: width/2, y: height/2)
        let radius = CGFloat(150)
        let circleBox = CGRect(x: centerPoint.x - radius, y: centerPoint.y - radius, width: radius*2, height: radius*2)
        
        let path = UIBezierPath(ovalIn: circleBox)
        UIColor.white.setFill()
        path.fill()
        path.stroke()

    }
    
    private func drawEvents(){
        let width = bounds.width
        let height = bounds.height
        let centerPoint = CGPoint(x: width/2, y: height/2)
        let radius = CGFloat(150)
        
        for event in events{
            let startAngle = convertTimeToAngle(time: event.startTime)
            let endAngle = convertTimeToAngle(time: event.endTime)

            let arc = UIBezierPath()
            arc.move(to: centerPoint)
            arc.addArc(withCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            UIColor.red.setFill()
            arc.fill()
        }
    }
    
    private func convertTimeToAngle(time: Date) -> CGFloat{
        // number of minutes in a 24 hour clock
        print(time)
        let totalClockMinutes = 1440.0
        let totalDegrees = 360.0
        
        let hour = getHour(time: time)
        let minute = getMinute(time: time)
        
        // map hours and minutes
        let hoursPlusMinutes = Double(hour) * 60.0 + Double(minute)
        
        let angle =  hoursPlusMinutes / totalClockMinutes * totalDegrees
        return degreesToRadians(degrees: angle)
    }
    
    private func degreesToRadians(degrees: Double) -> CGFloat{
        return CGFloat(((.pi * degrees) / 180.0))
    }
    
    private func getHour(time: Date) -> Int{
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: time)
        return components.hour!
    }
    
    private func getMinute(time: Date) -> Int{
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: time)
        return components.minute!
    }
}
