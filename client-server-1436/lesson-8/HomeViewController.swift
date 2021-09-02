//
//  HomeViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 02.09.2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    let authService = Auth.auth()
    
    let ref = Database.database().reference(withPath: "cities") //ccылка на контейнер/папку в Database
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.observe(.value, with: { snapshot in
            
            var cities: [CityFB] = []
            // 2
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let city = CityFB(snapshot: snapshot) {
                       cities.append(city)
                }
            }
//            // 3
//            self.cities = cities
//            self.tableView.reloadData()
            
            print(cities)
        })

       
    }
    
    func showLoginVC() {
        guard let vc = storyboard?.instantiateViewController(identifier: "LoginViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }

    @IBAction func signOutAction(_ sender: Any) {
        
        try? authService.signOut()
        showLoginVC()
    }
    

    @IBAction func addCityAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Добавить город", message: nil, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        let save = UIAlertAction(title: "Сохранить город", style: .default) { _ in
            
            guard let textField = alert.textFields?.first,
                  let cityName = textField.text else { return }
            
            //Готовим модель
            let city = CityFB(name: cityName, zipcode: Int.random(in: 100000...999999))
            
            //Готовим контейнер для записи города внутри Firebase (контейнер для конкретного города)
            let cityRef = self.ref.child(cityName)
            
            //Сохраняем dict в контейнер города
            //cities/moscow/[:]
            cityRef.setValue(city.toAnyObject())
        }
        
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(save)
        
        present(alert, animated: true, completion: nil)
    }
}
