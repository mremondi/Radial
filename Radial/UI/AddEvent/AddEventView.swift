//
//  AddEventView.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class AddEventView: UIView{
    var titleTextField: UITextField!
    var notesTextView: UITextView!
    
    var selectTimeView: UIView!
    var startTimeTextField: UITextField!
    var endTimeTextField: UITextField!
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = StyleKit.Colors.clockBackground
        initViews()
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews(){
        titleTextField = UITextField()
        notesTextView = UITextView()
        notesTextView.delegate = self
        startTimeTextField = UITextField()
        startTimeTextField.delegate = self
        endTimeTextField = UITextField()
        endTimeTextField.delegate = self
        
        [titleTextField, notesTextView, startTimeTextField, endTimeTextField].forEach{
            addSubview($0)
        }
    }
    
    private func initConstraints(){
        titleTextField.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 90, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 60))
        titleTextField.placeholder = "Event Name"
        titleTextField.backgroundColor = .white
        titleTextField.addPadding(.both(16))
        
        notesTextView.anchor(top: titleTextField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 180))
        notesTextView.text = "Notes"
        notesTextView.backgroundColor = .white
        
        startTimeTextField.anchor(top: notesTextView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 60))
        startTimeTextField.placeholder = "Start Time"
        startTimeTextField.backgroundColor = .white
        startTimeTextField.addPadding(.both(16))
        
        endTimeTextField.anchor(top: startTimeTextField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 60))
        endTimeTextField.placeholder = "Ending Time"
        endTimeTextField.backgroundColor = .white
        endTimeTextField.addPadding(.both(16))
        
    }
    
    public func getEventData() -> [String] {
        if titleTextField.text!.count > 0 && titleTextField.text != "Event Name"{
            if notesTextView.text!.count > 0 && notesTextView.text != "Notes"{
                if startTimeTextField.text!.count > 0 && startTimeTextField.text != "Start Time"{
                    if endTimeTextField.text!.count > 0 && endTimeTextField.text != "Ending Time"{
                        return [titleTextField.text!, notesTextView.text!, startTimeTextField.text!, endTimeTextField.text!]
                    } else{
                        endTimeTextField.borderWidth = 2
                        endTimeTextField.borderColor = .red
                    }
                } else {
                    startTimeTextField.borderWidth = 2
                    startTimeTextField.borderColor = .red
                }
            } else {
                notesTextView.borderWidth = 2
                notesTextView.borderColor = .red
            }
        } else {
            titleTextField.borderWidth = 2
            titleTextField.borderColor = .red
        }
        return []
    }
}

extension AddEventView: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}

extension AddEventView: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        
        if textField == startTimeTextField{
            startTimeTextField.inputView = datePickerView
            datePickerView.addTarget(self, action: #selector(AddEventView.startTimeChanged), for: UIControlEvents.valueChanged)
        }
        else if textField == endTimeTextField{
            endTimeTextField.inputView = datePickerView
            datePickerView.addTarget(self, action: #selector(AddEventView.endTimeChanged), for: UIControlEvents.valueChanged)
        }
    }
    
    @objc func startTimeChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        startTimeTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func endTimeChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        endTimeTextField.text = dateFormatter.string(from: sender.date)
    }
}
