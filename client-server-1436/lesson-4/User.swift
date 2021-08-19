//
//  File.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 19.08.2021.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var userId: String = ""
    @objc dynamic var name: String = ""
}
