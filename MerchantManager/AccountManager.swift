//
//  AccountManager.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-09.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

final class AccountManager {
    
    static var shared: AccountManager {
        return _shared
    }
    
    private static let _shared = AccountManager()
    
    private init() {
        
    }
    
    //Implementation
    
    
    func login (username: String, password: String) {

        let loginPostBody = LoginPostBody (username: "6049315255", password: "gp6049315255")
        
        DispatchQueue.global().sync {
            let response = ApiManager.shared.startServerCall(url: REST_PATH_LOGIN, method: .Post, body: loginPostBody)
            
            if let r = response {
                print(r)
            }
            
        }
    }
    
    func logout () {
        
    }
    
    func kickout () {
        
    }
    
    func cleanCache () {
        
    }
}
