//
//  SendViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 09.08.2021.
//

import UIKit


class SendViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var cashTextField: UITextField!
    
    let account = Account.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendCashAction(_ sender: Any) {
        
        //Ранний выход + разворачивание опционала
        guard let cashString = cashTextField.text, let cash = Int(cashString),
              let name = nameTextField.text
        else {
            return
        }
        
        account.name = name
        account.cash = cash
    }
    
}
