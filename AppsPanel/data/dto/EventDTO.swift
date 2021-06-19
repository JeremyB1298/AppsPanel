//
//  EventDTO.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class EventDTO: Codable {
    var id: Int
    var title: String?
    var description: String?
    var latitude: Double?
    var longitude: Double?
    var pictureUrl: String?
    var publishedAt: Double?
    
    init(id: Int, title: String? = nil, description: String? = nil, latitude: Double? = nil, longitude: Double? = nil, pictureUrl: String? = nil, publishedAt: Double? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.pictureUrl = pictureUrl
        self.publishedAt = publishedAt
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case latitude
        case longitude
        case pictureUrl = "picture_url"
        case publishedAt = "published_at"
    }
}
