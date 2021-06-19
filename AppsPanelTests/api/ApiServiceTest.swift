//
//  ApiServiceTest.swift
//  AppsPanelTests
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import XCTest
@testable import AppsPanel

class ApiServiceTest: XCTestCase {
    
    private var apiService: ApiService!
    
    override func setUpWithError() throws {
        self.apiService = ApiService()
    }

    override func tearDownWithError() throws {
        self.apiService = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
