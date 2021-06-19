//
//  EventMapperTest.swift
//  AppsPanelTests
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import XCTest
@testable import AppsPanel

class EventMapperTests: XCTestCase {
    
    private var eventMapper: EventMapper!
    private var eventDTO: EventDTO!
    private var eventDTO2: EventDTO!
    
    override func setUpWithError() throws {
        self.eventMapper = EventMapper()
        self.eventDTO = EventDTO(id: 0, title: "titre", description: "description", latitude: 10, longitude: 20, pictureUrl: "picture", publishedAt: 100)
        self.eventDTO2 = EventDTO(id: 1, title: "titre2", description: "description2", latitude: 20, longitude: 30, pictureUrl: "picture2", publishedAt: 200)
    }

    override func tearDownWithError() throws {
        self.eventMapper = nil
        self.eventDTO = nil
    }

    func testMappingDTO() throws {
        let event = self.eventMapper.mapEvent(event: self.eventDTO)
        XCTAssertEqual(event.id, eventDTO.id)
        XCTAssertEqual(event.title, eventDTO.title)
        XCTAssertEqual(event.description, eventDTO.description)
        XCTAssertEqual(event.latitude, eventDTO.latitude)
        XCTAssertEqual(event.longitude, eventDTO.longitude)
        XCTAssertEqual(event.pictureUrl, eventDTO.pictureUrl)
        XCTAssertEqual(event.publishedAt, eventDTO.publishedAt)
    }
    
    func testMappingArrayDTO() throws {
        
        let events = self.eventMapper.mapEvents(events: [self.eventDTO2, self.eventDTO])
        
        XCTAssertEqual(events[0].id, eventDTO2.id)
        XCTAssertEqual(events[0].title, eventDTO2.title)
        XCTAssertEqual(events[0].description, eventDTO2.description)
        XCTAssertEqual(events[0].latitude, eventDTO2.latitude)
        XCTAssertEqual(events[0].longitude, eventDTO2.longitude)
        XCTAssertEqual(events[0].pictureUrl, eventDTO2.pictureUrl)
        XCTAssertEqual(events[0].publishedAt, eventDTO2.publishedAt)
        
        XCTAssertEqual(events[1].id, eventDTO.id)
        XCTAssertEqual(events[1].title, eventDTO.title)
        XCTAssertEqual(events[1].description, eventDTO.description)
        XCTAssertEqual(events[1].latitude, eventDTO.latitude)
        XCTAssertEqual(events[1].longitude, eventDTO.longitude)
        XCTAssertEqual(events[1].pictureUrl, eventDTO.pictureUrl)
        XCTAssertEqual(events[1].publishedAt, eventDTO.publishedAt)
        
    }
}
