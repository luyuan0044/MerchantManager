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
    func startRequest () {
        let oauthClient = ApiManager.shared.getOauthClient()
        oauthClient.request("https://api.goopter.com/api/rest/adm/v2/storedetails", method: .GET, parameters: [:], headers: [:], body: nil, checkTokenExpiration: false, success: {
            response in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments)
                print(jsonObject)
                let storeObject = Mapper<ApiResponse<Store>>.init().map(JSON: jsonObject as! [String: AnyObject])
            } catch {
                print (error)
            }
        }, failure: {
            response in
            
            print (response)
        })
    }
}
