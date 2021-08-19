//
//  Friends.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 16.08.2021.
//

import Foundation
import RealmSwift

// MARK: - FriendsResponse
struct FriendsResponse: Codable {
    let response: Friends
}

// MARK: - Response
struct Friends: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
class Friend: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var photo50: String
    @objc dynamic var firstName: String
    @objc dynamic var photo100: String

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case firstName = "first_name"
        case photo100 = "photo_100"
    }
}
