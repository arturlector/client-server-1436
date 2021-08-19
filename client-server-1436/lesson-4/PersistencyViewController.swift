//
//  PersistencyViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 19.08.2021.
//

import UIKit
import SwiftKeychainWrapper
import RealmSwift


class PersistencyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //useUserDefaults()
        //useKeychain()
        
        //writeRealmDB()
        //readRealmDB()
        
        useCoreData()
        loadHumans()
    }
    
    func useCoreData() {
        
        let application =  UIApplication.shared.delegate as! AppDelegate
        let context = application.persistentContainer.viewContext

        let newHuman = Human(context: context)
        newHuman.name = "Jon"
        newHuman.gender = true
        newHuman.birthday = Date()
        application.saveContext()
    }
    
    func loadHumans() {
        let application =  UIApplication.shared.delegate as! AppDelegate
        let context = application.persistentContainer.viewContext
        let results = try! context.fetch(Human.fetchRequest()) as! [Human]
        let human = results.first!
        
        print(human)
    }

    
    func useUserDefaults() {
        
        var isOnboarded = UserDefaults.standard.bool(forKey: "isOnboarded")
        var step = UserDefaults.standard.integer(forKey: "step")
        
        var token = UserDefaults.standard.string(forKey: "token")
        
        print(isOnboarded)
        print(step)
        print(token)
        
        UserDefaults.standard.set(true, forKey: "isOnboarded")
        //UserDefaults.standard.set(3, forKey: "step")
        
        UserDefaults.standard.set(3, forKey: "step")
        UserDefaults.standard.set("122458asdfasdf", forKey: "token")
    }
    
    func useKeychain() {
        
        var vkToken: Int?  = KeychainWrapper.standard.integer(forKey: "vkToken")
        var login: String? = KeychainWrapper.standard.string(forKey: "login")
        
        print(vkToken as Any)
        print(login as Any)
        
        KeychainWrapper.standard.set(124421345, forKey: "vkToken")
        KeychainWrapper.standard.set("admin1234", forKey: "login")
        
        print(vkToken as Any)
        print(login as Any)
    }
    
  
    func writeRealmDB() {
        
        let user = User()
        user.name = "Lucky"
        user.userId = "200"
        
        let realm = try! Realm()
        
        try? realm.write {
            realm.add(user)
        }
        
        
    }
    
    func readRealmDB() {
        
        let realm = try! Realm()
        
        let user = realm.objects(User.self).first
        
        print(user?.name, user?.userId)
    }
    
    


}
