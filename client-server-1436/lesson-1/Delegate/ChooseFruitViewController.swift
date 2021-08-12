//
//  ChooseFruitViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 12.08.2021.
//

import UIKit

//FirstVC
class ChooseFruitViewController: UIViewController, DisplayFruitsTableControllerDelegate {
    
    @IBOutlet weak var fruitLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //Delegate
    func fruitDidSelect(fruit: String) {
        
        //fruitLabel.text = fruit
        
    }
    
    @IBAction func chooseFruitAction(_ sender: Any) {
        
        //SecondVC
        let displayFruitsVC = DisplayFruitsTableController()
        displayFruitsVC.delegate = self
        
        //Closure
        displayFruitsVC.fruitSelect = { [weak self] fruit in
            
            self?.fruitLabel.text = fruit
        }
        
        navigationController?.pushViewController(displayFruitsVC, animated: true)
    }
    

}
