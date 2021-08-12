//
//  NotificationCenterViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 09.08.2021.
//

import UIKit

let backgroundChangeColorNotification = Notification.Name("backgroundChangeColorNotification")

class NotificationCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: backgroundChangeColorNotification, object: nil)
        
        
    }
    
    @objc
    private func changeColor(notification: Notification) {
        
        guard let color = notification.userInfo?["color"] as? UIColor else { return }
        
        view.backgroundColor = color
    }
    
 
    
    @IBAction func changeBackgroundAction(_ sender: Any) {
        
        let color = UIColor.yellow
        NotificationCenter.default.post(name: backgroundChangeColorNotification, object: nil, userInfo: ["color": color])
    }
    

}
