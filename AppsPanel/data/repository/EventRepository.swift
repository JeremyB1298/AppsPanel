//
//  EventRepository.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import Foundation

class EventRepository {
    
    private var apiService: ApiService
    private var eventMapper: EventMapper
    
    init(apiService: ApiService, eventMapper: EventMapper) {
        self.apiService = apiService
        self.eventMapper = eventMapper
    }
    
    func retrieveEvents(completion: @escaping (([Event]?) -> Void)) {
        self.apiService.loadJson(fromURLString: ApiValues.EVENTS_URL, headers: ["X-AP-Key":"uD4Muli8nO6nzkSlsNM3d1Pm", "X-AP-DeviceUID":"trial", "Accept":"application/json"]) { result in
            switch result {
                case .success(let data):
                    if let eventsDTO = self.apiService.parse(T: [EventDTO].self, jsonData: data) {
                        let events = self.eventMapper.mapEvents(events: eventsDTO)
                        completion(events)
                    } else {
                        completion(nil)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil)
                }
        }
    }
    
}
