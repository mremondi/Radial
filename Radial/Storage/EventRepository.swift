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
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Event", in: managedContext)!
        let eventCache = NSManagedObject(entity: entity, insertInto: managedContext)

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
    
    func getEvents(for date: Date) -> [EventModel] {
        let allEvents = getAllEvents()
        print("all events count")
        print(allEvents.count)
        var selectedDateEvents: [EventModel] = []
        
        let selectedDate = date
        let selectedDateCalendar = Calendar.current
        let selectedDateComponents = selectedDateCalendar.dateComponents([.year, .month, .day], from: selectedDate)
        
        let selectedDateYear =  selectedDateComponents.year
        let selectedDateMonth = selectedDateComponents.month
        let selectedDateDay = selectedDateComponents.day
        
        for event in allEvents{
            let date = event.startTime
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: date)
            
            let year =  components.year
            let month = components.month
            let day = components.day
            
            if (selectedDateYear == year && selectedDateMonth == month && selectedDateDay == day){
                selectedDateEvents.append(event)
            }
        }
        print("todays events count")
        print(selectedDateEvents.count)
        return selectedDateEvents
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
            let startTime = dateFromString(dateString: managedEvent.value(forKey: "startTime") as! String)
            let endTime = dateFromString(dateString: managedEvent.value(forKey: "endTime") as! String)
            let event = EventModel(title: managedEvent.value(forKey: "title") as! String, notes: managedEvent.value(forKey: "notes") as! String, startTime: startTime, endTime: endTime)
            events.append(event)
        }
        return events
    }
    
    private func dateFromString(dateString: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        if let date = dateFormatter.date(from: dateString){
            return date
        }
        return Date()
    }
}
