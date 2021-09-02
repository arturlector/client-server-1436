//
//  PersonDB.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 26.08.2021.
//

import Foundation
import RealmSwift

protocol PersonDBProtocol {
    
    func add(_ user: PersonModel)
    func fetch() -> [PersonModel]
    func delete(_ user: PersonModel)
}

class PersonDB: PersonDBProtocol {
    
    let config = Realm.Configuration(schemaVersion: 2)
    lazy var mainRealm = try! Realm(configuration: config)
    
    
    func add(_ user: PersonModel) {
        
        do {
            //Сохранение объекта
            mainRealm.beginWrite()
            mainRealm.add(user)
            try mainRealm.commitWrite()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func fetch() -> [PersonModel] {
        
        //Прочитать объекты
        let users = mainRealm.objects(PersonModel.self)
        users.forEach { print($0.name, $0.age, $0.id) }
        print(mainRealm.configuration.fileURL)
        return Array(users)
    }
    
    func delete(_ user: PersonModel) {
        //Удаление объекта
        mainRealm.beginWrite()
        mainRealm.delete(user)
        try? mainRealm.commitWrite()
    }
    
    
}
