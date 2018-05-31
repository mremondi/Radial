//
//  EventRepository.swift
//  Radial
//
//  Created by Michael Remondi on 5/31/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EventRepository{
    
    func createEvent(eventData: [String]){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        print("here")
        let managedContext = appDelegate.persistentContainer.viewContext
        print("here2")
        let entity = NSEntityDescription.entity(forEntityName: "Event", in: managedContext)!
        print("here3")
        let eventCache = NSManagedObject(entity: entity, insertInto: managedContext)
        print("here4")
        eventCache.setValue(eventData[0], forKeyPath: "title")
        eventCache.setValue(eventData[1], forKeyPath: "notes")
        eventCache.setValue(eventData[2], forKeyPath: "startTime")
        eventCache.setValue(eventData[3], forKeyPath: "endTime")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getAllEvents() -> [EventModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
        let managedContext = appDelegate.persistentContainer.viewContext
    
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Event")
    
        do {
            let managedEvents = try managedContext.fetch(fetchRequest)
            let events = self.mapManagedEvents(managedEvents: managedEvents)
            return events
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    private func mapManagedEvents(managedEvents: [NSManagedObject]) -> [EventModel]{
        var events: [EventModel] = []
        managedEvents.forEach {
            let managedEvent = $0
            let startTime = Date()//managedEvent.value(forKey: "startTime") as! String
            let endTime = Date()//managedEvent.value(forKey: "endTime") as! String
            let event = EventModel(title: managedEvent.value(forKey: "title") as! String, notes: managedEvent.value(forKey: "notes") as! String, startTime: startTime, endTime: endTime)
            print(event)
            events.append(event)
        }
        return events
    }
}
