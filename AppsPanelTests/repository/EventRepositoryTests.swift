//
//  EventRepositoryTests.swift
//  AppsPanelTests
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import XCTest
@testable import AppsPanel

class EventRepositoryTests: XCTestCase {
    
    private var eventRepository: EventRepository!
    
    override func setUpWithError() throws {
        self.eventRepository = EventRepository(apiService: ApiService(), eventMapper: EventMapper())
    }

    override func tearDownWithError() throws {
        self.eventRepository = nil
    }

    func testRetrieveEvents() throws {
        self.eventRepository.retrieveEvents { events in
            XCTAssertNotNil(events)
        }
    }

}
