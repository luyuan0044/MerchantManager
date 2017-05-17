//
//  AccountManager.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-09.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class AccountManager {
    
    static var shared: AccountManager {
        return _shared
    }
    
    private static let _shared = AccountManager()
    
    private init() {
        
    }
    
    //Implementation
    
    
    func login (username: String, password: String) {
        DispatchQueue.global().sync {
            let loginPostBody = LoginPostBody (username: "6049315255", password: "gp6049315255")
            let path = BASE_URL.appendingPathComponent(REST_PATH_LOGIN)
            let body = loginPostBody.toDictionary()
            
            print(body)
        
            let resultJson = ApiManager.shared.startServerCall(url: path, method: .post, body: body)
            print(resultJson)
            
            /*
            let response = ApiManager.shared.startServerCall(url: REST_PATH_LOGIN, method: .Post, body: loginPostBody)
            
            if let r = response {
                print(r)
            }
            */
        }
    }
    
    func logout () {
        
    }
    
    func kickout () {
        
    }
    
    func cleanCache () {
        
    }
}
