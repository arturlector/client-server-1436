//
//  ObjectNotificationsViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 30.08.2021.
//

import UIKit
import RealmSwift

class StepCounter: Object {
    @objc dynamic var steps = 0
}

class ObjectNotificationsViewController: UIViewController {
    
    @IBOutlet weak var stepCountLabel: UILabel!
    
    let config = Realm.Configuration(schemaVersion: 4)
    lazy var mainRealm = try! Realm(configuration: config)
    
    let stepCounter = StepCounter()
    
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        try? mainRealm.write({
            mainRealm.add(stepCounter)
        })
        
        token = stepCounter.observe({ [weak self] objectChange in
            
            switch objectChange {
            
            case .error(let error):
                print("\(error)")
            case .change(let properties, _):
                print(properties)
            case .deleted:
                print("object deleted")
            }
            
            guard let self = self else { return }
            self.stepCountLabel.text = "Steps: \(self.stepCounter.steps)"
        })
        
    }
    


    @IBAction func stepUpAction(_ sender: Any) {
        
        try? mainRealm.write({
            stepCounter.steps = stepCounter.steps + 1
        })
    }
    
}
