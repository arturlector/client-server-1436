//
//  RealmNotificationsViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 30.08.2021.
//

import UIKit
import RealmSwift


class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var gender = 1
    @objc dynamic var age = 0
}

class RealmNotificationsViewController: UIViewController {

    var dogs: Results<Dog>?
    
    var token: NotificationToken?
    
    let config = Realm.Configuration(schemaVersion: 3)
    lazy var mainRealm = try! Realm(configuration: config)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        dogs = mainRealm.objects(Dog.self).filter("age >= 3").sorted(byKeyPath: "name")
        
        
        self.token = dogs?.observe {  (changes: RealmCollectionChange) in
            
            switch changes {
            
            case .initial(_):
                print("initial")
                //self?.tableView.reloadData()
            case .update(let results, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                print("modifications", modifications)
                print("results", results)
                
//                self?.tableView.beginUpdates()
//                self?.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
//                                     with: .automatic)
//                self?.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
//                                     with: .automatic)
//                self?.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
//                                     with: .automatic)
//                self?.tableView.endUpdates()
                
            case .error(let error):
                print("error", error.localizedDescription)
            }
        }

        
        let dog1 = Dog()
        dog1.name = "Jack"
        dog1.age = 3
        
        let dog2 = Dog()
        dog2.name = "Lucky"
        dog2.age = 1
        
        let dog3 = Dog()
        dog3.name = "Fiji"
        dog3.age = 5
        
        try? mainRealm.write({
            mainRealm.add([dog1, dog2, dog3])
        })
        
        print(mainRealm.configuration.fileURL as Any)
        
    }
    


}
