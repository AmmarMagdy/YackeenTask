//
//  Request.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation

class Request {
    
    func requestAPI(router: Router, callbackSuccess: @escaping (([[String:Any]])->()), callbackFail: @escaping((Int?, String?)->()), callbackEndDueToError: @escaping((String)->())) {
        
        let dataTask = URLSession.shared.dataTask(with: router.asURLRequest()) { (data, urlResponse, error) in
            if let error = error {
                callbackEndDueToError(error.localizedDescription)
            }
            if let data = data {
                do {
                     let json = try JSONSerialization.jsonObject(with: data)
                     if let jsonArray = json as? [[String:Any]] {
                        print("json is array", jsonArray)
                         callbackSuccess(jsonArray)
                     } else if let jsonDictionary = json as? [String:Any] {
                         callbackFail((urlResponse as? HTTPURLResponse)?.statusCode, jsonDictionary["message"] as? String)
                         print("json is dictionary", jsonDictionary)
                      }  else {
                        print("This should never be displayed")
                     }
                } catch {
                    callbackFail((urlResponse as? HTTPURLResponse)?.statusCode, error.localizedDescription)
                    print(error.localizedDescription)
                }
            }      
        }
        dataTask.resume()
        return
    }
    
}
