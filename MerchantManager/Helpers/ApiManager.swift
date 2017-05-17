//
//  ApiManager.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-15.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

//typealias DataCompletion = (Data?, Error?) -> Void

enum httpRequestMethod: String {
    case Post = "POST"
    case Get = "GET"
}

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
    func startServerCallWithOauth(url: String, method: httpRequestMethod, body: Any?){
        
    }
    
    func startServerCall(url: URL, method: HTTPMethod, body: Parameters?) -> JSON? {
        var result: JSON?
        
        Alamofire.request(url, method: method, parameters: body, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                result = json
            case .failure(let error):
                print(error)
            }
        })
        
        return result
    }
}
