//
//  EventViewModel.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class EventViewModel {
    private var eventRepository: EventRepository
    
    init(eventRepository: EventRepository) {
        self.eventRepository = eventRepository
    }
    
    func retrieveEvents(completion: @escaping (([Event]?) -> Void)) {
        self.eventRepository.retrieveEvents { event in
            completion(event?.sorted(by: { Double($0.publishedAt ?? 0) > Double($1.publishedAt ?? 0) }))
        }
    }
    
}
