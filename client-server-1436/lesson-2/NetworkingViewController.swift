//
//  NetworkingViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 12.08.2021.
//

import UIKit
import Alamofire

class NetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        secondRequest()
    }
    

    func secondRequest() {
        
        let baseURL = "http://samples.openweathermap.org"
        let path = "/data/2.5/forecast"
        
        let url = "\(baseURL)\(path)"
        var urlParameters: Parameters = [
            "q": "Moscow,DE",
            "appid": "b1b15e88fa797225412429c1c50c122a1"
        ]
        
        AF.request(url, method: .get, parameters: urlParameters).responseJSON { response in
            
            print(response.request) //запрос
            print(response.response) //ответ - статус код и хедеры
            print(response.data) //бинарник
            print(response.result) //JSON
        }
        
       
        
    }
    
    func firstRequest() {
        
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1")
        else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            print(json)
        }
        
        task.resume()
        
        
    }
    
    
    
    func thirdRequest() {
        
    }
  

}
