//
//  FriendsAPI.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 12.08.2021.
//

import Foundation
import Alamofire
import DynamicJSON

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.21"
    
    func getFriends(completion: @escaping([FriendDynamic])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "count": 5,
            "fields": "photo_100, photo_50",
            "access_token": Session.shared.token,
            "v": version]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.data?.prettyJSON)
            
            guard let data = response.data else { return }
            
            do {
                
                guard let items = JSON(data).response.items.array else { return }
                let friends = items.map { FriendDynamic(json: $0) }
                
    
                completion(friends)
                
            } catch {
                print(error)
            }

        }
    }
    
    /*
    func getFriends(completion: @escaping([FriendManual])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "count": 5,
            "fields": "photo_100, photo_50",
            "access_token": Session.shared.token,
            "v": version]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.data?.prettyJSON)
            
            guard let data = response.data else { return }
            
            do {
                
                let json: Any = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                let object = json as! [String: Any]
                
                let response = object["response"] as! [String: Any]
                
                let items = response["items"] as! [Any]
                
//                var friends: [FriendManual] = []
//                for item in items {
//                    let friend = FriendManual(item: item as! [String: Any])
//                    friends.append(friend)
//                }
                
                let friends = items.map { FriendManual(item: $0 as! [String : Any])}
                
                completion(friends)
                
            } catch {
                print(error)
            }

        }
    }
     */
}

    
    /*
    func getFriends(completion: @escaping([Friend])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "count": 5,
            "fields": "photo_100, photo_50",
            "access_token": Session.shared.token,
            "v": version]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.data)
            print(response.result)
            print("-----------------------")
            print(response.data?.prettyJSON)
            
            guard let data = response.data else { return }
            
            do {
                
                let friendsResponse = try JSONDecoder().decode(FriendsResponse.self, from: data)
                let friends = friendsResponse.response.items
                completion(friends)
                
                
            } catch {
                print(error)
            }

        }
    }
}
 
 */
