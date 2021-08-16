//
//  FriendDynamic.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 16.08.2021.
//

import Foundation
import DynamicJSON

struct FriendDynamic {

    var id: Int = 0
    var lastName: String = ""
    var photo50: String = ""
    var firstName: String = ""
    var photo100: String = ""

    init(json: JSON) {
        self.id = json.id.int ?? 0 //json["id"] as! Int
        self.firstName = json.first_name.string ?? "" //json["first_name"] as! String
        self.lastName = json.last_name.string ?? "" //json["last_name"] as! String
    }
}
