//
//  Event.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit

class Event {
    
    var id: Int
    var title: String?
    var description: String?
    var latitude: Double?
    var longitude: Double?
    var pictureUrl: URL?
    var publishedAt: Double?
    var stringPublichedAt: String? {
        get {
            if let publishedAt = self.publishedAt {
                let eventDatecompanents = Date(timeIntervalSince1970: TimeInterval(publishedAt))
                let currentDatecompanents = Date()
                let calendar = Calendar(identifier: .gregorian)
                
                switch calendar.numberOfDaysBetween(eventDatecompanents, and: currentDatecompanents) {
                case 0:
                    return "aujourd'hui"
                case 1:
                    return "hier"
                default:
                    return "il y a \(calendar.numberOfDaysBetween(eventDatecompanents, and: currentDatecompanents)) jours"
                }
                
            } else {
                return nil
            }
        }
    }
    
    init(id: Int, title: String? = nil, description: String? = nil, latitude: Double? = nil, longitude: Double? = nil, pictureUrl: String? = nil, publishedAt: Double? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        
        if let pictureUrl = pictureUrl {
            self.pictureUrl = URL(string: pictureUrl)!
        }
        self.publishedAt = publishedAt
        
    }
    
}
