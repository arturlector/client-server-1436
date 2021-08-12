//
//  Account.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 12.08.2021.
//

import Foundation

final class Account {
    
    private init() {}
    
    static let shared = Account()
    
    var name: String = ""
    var cash: Int = 0
    
}
