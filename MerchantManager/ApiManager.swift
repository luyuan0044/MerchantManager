//
//  ApiManager.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-15.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

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
    
    func startServerCall(url: String, method: httpRequestMethod, body: Any?) -> Data? {
        let semaphore = DispatchSemaphore (value: 0)
        
        let path = BASE_URL.appendingPathComponent(url)
        
        var urlRequest = URLRequest.init(url: path)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        var jsonData: NSData? = nil
        do {
            if let body = body,
                method == httpRequestMethod.Post {
                jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) as NSData
            }
             urlRequest.httpBody = jsonData! as Data
        } catch {
            print(error)
        }
        
        //URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
        //}).resume()
        
        var responseData: Data? = nil
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            responseData = data
        }
        
        task.resume()
        
        semaphore.wait(timeout: .distantFuture)
        semaphore.signal()
        
        return responseData
    }
}
