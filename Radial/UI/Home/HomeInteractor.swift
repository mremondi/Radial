//
//  HomeInteractor.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation

class HomeInteractor{
    func getAllEvents() -> [EventModel]{
        let repository = EventRepository()
        return repository.getAllEvents()
    }
}
