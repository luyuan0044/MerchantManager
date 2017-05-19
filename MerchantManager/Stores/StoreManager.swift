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
        let client = OAuthSwiftClient (consumerKey: "8fb7ec71f8b4e1f2ec28d2f8c3f7785a", consumerSecret: "af035f0f340e090d5b51870f9a168acd")
        client.credential.oauthToken = (AccountManager.shared.oauth?.token!)!
        client.credential.oauthTokenSecret = (AccountManager.shared.oauth?.secret!)!
        
        /*
        client.makeRequest("https://api.goopter.com/api/rest/adm/v2/storedetails", method: .GET, parameters: [:], headers: [:], body: nil, success: {
            response in
            
            print(response)
        })
        */
        client.request("https://api.goopter.com/api/rest/adm/v2/storedetails", method: .GET, parameters: [:], headers: [:], body: nil, checkTokenExpiration: false, success: {
            response in
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments)
                print(jsonObject)
            } catch {
                print (error)
            }
        }, failure: {
            response in
            
            print (response)
        })
    }
}
