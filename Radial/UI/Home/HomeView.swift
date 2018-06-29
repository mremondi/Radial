//
//  HomeView.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewDelegate{
    func newDateSelected(date: Date)
}

class HomeView: UIView{
    var delegate: HomeViewDelegate?
    
    var selectedDate: Date?
    
    var dateTextField: UITextField!
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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeView.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
        
        dateTextField = UITextField()
        dateTextField.delegate = self
        clockView = ClockView()
        
        [dateTextField, clockView].forEach{
            addSubview($0)
        }
    }
    
    func initConstraints(){
        dateTextField.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 60))
        dateTextField.backgroundColor = .white
        dateTextField.textAlignment = .center
        dateTextField.text = "TODAY"
        
        clockView.anchorCenter(to: self)
        clockView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 400, height: 400))
    }
    
    func configureView(events: [EventModel]){
        clockView.redraw(events: events)
        
        UIView.animate(withDuration: 0.5, delay:0, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(2)
            self.clockView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        }, completion: {completion in
            self.clockView.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
        
        // todo: move this to another method when we have a submit button
        if let date = self.selectedDate {
            delegate?.newDateSelected(date: date)
        }
    }
}


extension HomeView: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        dateTextField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(HomeView.datePicked), for: UIControlEvents.valueChanged)
    }
    
    @objc func datePicked(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        dateTextField.text = dateFormatter.string(from: sender.date)

        self.selectedDate = sender.date
    }
}
