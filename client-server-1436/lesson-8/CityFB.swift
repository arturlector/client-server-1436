//
//  CityFB.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 02.09.2021.
//

import Foundation
import Firebase

class CityFB {
    
    let name: String
    let zipcode: Int
    
    let ref: DatabaseReference?
    
    init(name: String, zipcode: Int) {
        self.ref = nil
        self.name = name
        self.zipcode = zipcode
    }
    
    init?(snapshot: DataSnapshot) {
        
        guard
            let value = snapshot.value as? [String: Any],
            let zipcode = value["zipcode"] as? Int,
            let name = value["name"] as? String
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.zipcode = zipcode
    }
    
    func toAnyObject() -> [AnyHashable: Any] {
        return
            [ "name": name,
              "zipcode": zipcode ] as [AnyHashable: Any]
    }
}
