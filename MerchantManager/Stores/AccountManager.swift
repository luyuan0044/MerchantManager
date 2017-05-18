//
//  AccountManager.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-09.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

final class AccountManager {
    
    static var shared: AccountManager {
        return _shared
    }
    
    private static let _shared = AccountManager()
    
    private init() {
        
    }
    
    //Mark:
    var current: Profile?
    
    //Mark: Implementation
    func login (username: String, password: String, completion: @escaping (Bool) -> ()) {
        let loginPostBody = LoginPostBody (username: "6049315255", password: "gp6049315255")
        let path = BASE_URL.appendingPathComponent(REST_PATH_LOGIN)
        let body = loginPostBody.toDictionary()
        
        Alamofire.request(path, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject(completionHandler: {
            (response: DataResponse<ApiResponse<LoginResponse>>) in
            
            if let serverReturn = response.result.value {
                if (serverReturn.getStatus() == apiStatus.success) {
                    self.current = serverReturn.records?.profile
                }
                else {
                    
                }
            }
            
            completion(true)
        })
    }
    
    func logout () {
        
    }
    
    func kickout () {
        
    }
    
    func cleanCache () {
        
    }
}
