//
//  StoreManager.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire
import OAuthSwiftAlamofire
import OAuthSwift
import ObjectMapper


//Mark: Notifications
let requsetStoreDataCompleteNotification = "requsetStoreDataCompleteNotification"

class StoreManager {
    static var shared: StoreManager {
        return _shared
    }
    
    private static let _shared = StoreManager()
    
    private init() {
        
    }
    
    //Mark: Properties
    var current: Store?
    
    //Mark: Implementation
    func requestStoreData () {
        
        var status: apiStatus = apiStatus.unknownError
        let oauthClient = ApiManager.shared.getOauthClient()
        let path = BASE_URL.appendingPathComponent(REST_PATH_STORE)
        oauthClient.request(path.absoluteString, method: .GET, parameters: [:], headers: [:], body: nil, checkTokenExpiration: false, success: {
            response in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments)
    
                let storeObject = Mapper<ApiResponse<Store>>.init().map(JSON: jsonObject as! [String: AnyObject])
                
                if let object = storeObject {
                    status = object.getStatus()
                }
            } catch {
                print (error)
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: requsetStoreDataCompleteNotification), object: nil)
            
        }, failure: {
            response in
            
            print (response)
        })
    }
}
