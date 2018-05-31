//
//  AddEventInteractor.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation

class AddEventInteractor{
    func createEvent(eventData: [String]){
        let repository = EventRepository()
        repository.createEvent(eventData: eventData)
    }
}
