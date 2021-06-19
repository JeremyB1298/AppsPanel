//
//  EventMapper.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class EventMapper {
    
    func mapEvent(event: EventDTO) -> Event {
        return Event(id: event.id, title: event.title, description: event.description, latitude: event.latitude, longitude: event.longitude, pictureUrl: event.pictureUrl, publishedAt: event.publishedAt)
    }
    
    func mapEvents(events: [EventDTO]) -> [Event] {
        return events.map(self.mapEvent)
    }
}
