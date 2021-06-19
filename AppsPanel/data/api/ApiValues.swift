//
//  ApiValues.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import Foundation

enum ApiValues {
    private static let BASE_URL: String = "https://test-pgt-dev.apnl.ws"
    static let EVENTS_URL: String = BASE_URL + "/events"
    static let INFOS_URL: String = BASE_URL + "/html"
    static let SIGNUP_URL: String = BASE_URL + "/authentication/register"
}
