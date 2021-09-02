//
//  RealmViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 26.08.2021.
//

import UIKit
import RealmSwift

class PersonModel: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var id = 0
    @objc dynamic var pet = ""
    @objc dynamic var car = ""
    @objc dynamic var mobile = ""
    
//    override static func primaryKey() -> String? {
//         return "id"
//    }
    
}

class RealmViewController: UIViewController {

    let personDB = PersonDB()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person2 = PersonModel()
        person2.name = "Deleted 2"
        person2.age = 22
        person2.id = 3
        person2.pet = "Jobbby"
        person2.car = "Camar"
        person2.mobile = "iPhone"
        
        personDB.add(person2)
        print(personDB.fetch())

        personDB.delete(person2)
        print(personDB.fetch())
               
    }

}
