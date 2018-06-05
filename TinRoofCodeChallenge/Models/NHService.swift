//
//  NWService.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation

class NHService: NSObject {

    private override init(){}
    static let shared = NHService()
    
    func makeGETCall(url: EndPoints, completionHandler: @escaping ([User])->Void){
        
        guard let endPoint = URL(string: url.rawValue) else { return }
        
        var urlRequest = URLRequest(url: endPoint)
        urlRequest.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil && data == nil{
                print("Error handling Request Call")
                return
            }
            
            guard let data = data else { return }
            
            do{
                
                let posts:[Post] = try JSONDecoder().decode([Post].self, from: data)
                
                DispatchQueue.main.async {
                    let users = self.createUsersWith(posts: posts)
                    completionHandler(users)
                }
                
            }catch let error as NSError{
                print("Error hanlding POSTS, Error: \(error)")
                return
            }
            
        }
        task.resume()
        
        
    }
    
    func createUsersWith(posts: [Post])->[User]{
        
        var ids = [Int]()
        for post in posts{
            ids.append(post.userId!)
        }
        
        //reducing duplicateds
        let newIds = Array(Set(ids)).sorted(by:{
            return $0 < $1
        })
        
        var users = [User]()
        
        for id in newIds{
            var user = User(userId: id, posts: [], complete: 0, incomplete: 0)
            
            for post in posts{
                if user.userId == post.userId{
                    user.posts.append(UserPost(id: post.id!, title: post.title!, completed: post.completed!))
                    
                    if post.completed == false {
                        user.incomplete += 1
                    }else{
                        user.complete += 1
                    }
                    
                }
            }
            
            users.append(user)
        }
        
        return users
    }
    
    
}

