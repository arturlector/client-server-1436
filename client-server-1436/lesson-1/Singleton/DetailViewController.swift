//
//  DetailViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 09.08.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cashLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLabel.text = Account.shared.name
        cashLabel.text = String(Account.shared.cash)
       
    }

}
