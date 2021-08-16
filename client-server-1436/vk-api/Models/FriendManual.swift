//
//  FriendManual.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 16.08.2021.
//

import Foundation

struct FriendManual {
    var id: Int = 0
    var firstName: String?
    var lastName: String?
    var photo100: String = ""
    
    init(item: [String: Any]) {
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as? String
        self.lastName = item["last_name"] as? String
    }
}
