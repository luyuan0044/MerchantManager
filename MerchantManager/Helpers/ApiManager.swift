//
//  ApiManager.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-15.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire

//typealias DataCompletion = (Data?, Error?) -> Void

class ApiManager {
    static var shared: ApiManager {
        return _shared
    }
    
    private static let _shared = ApiManager()
    
    private init() {
        
    }
    
    var consumerKey: String?
    var consumerSecret: String?
    
    var accessKey: String?
    var accessToken: String?
    
    //Clean up access key pairs
    func cleanup () {
        accessKey = nil
        accessToken = nil
    }
    
    //Base api call functions
    func startServerCallWithOauth(url: String, method: HTTPMethod, body: Any?){
        
    }
    
    func startServerCall(url: URL, method: HTTPMethod, body: Parameters?, onCompletion: @escaping (ApiResponse?)->()) {
        print("Request Url: \(url)  HTTPMethod: \(method)")
        
        if let body = body {
            print("Post Body: \(body)")
        }
        
        Alamofire.request(url, method: method, parameters: body, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            /*
            switch response.result {
            case .success(let value):
                result = nil
            case .failure(let error):
                print(error)
            }
            
            let apiResponse = ApiResponse(result)
            */
            
            onCompletion (nil)
        })
    }
}
