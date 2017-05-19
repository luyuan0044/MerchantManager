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
    
    //Mark: Properties
    
    var current: Profile?
    
    //Mark: Implementation
    
    func login (username: String, password: String, completion: @escaping (Bool) -> ()) {
        
//        let loginPostBody = LoginPostBody (username: "6049315255", password: "gp6049315255")
        let loginPostBody = LoginPostBody (username: username, password: password)
        let body = loginPostBody.toJSON()
        let path = BASE_URL.appendingPathComponent(REST_PATH_LOGIN)
        
        Alamofire.request(path, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject(completionHandler: {
            (response: DataResponse<ApiResponse<LoginResponse>>) in
            
            print(response)
            
            //more safeguard for value check and setup
            if let serverReturn = response.result.value {
                if (serverReturn.getStatus() == apiStatus.success) {
                    self.current = serverReturn.records!.profile
                    
                    if let profile = self.current {
                        if let groups = profile.stores {
                            GroupList.shared.setGroups(groups)
                            
                            //setup current group id and follow by loading additional information
                            GroupList.shared.switchGroup(id: profile.currentStore!.id)
                        }
                    }
                    
                    //setup keypair to ApiManager
                    ApiManager.shared.setupOauthKeypair(serverReturn.records!.oauth!)
                }
            }
            
            completion(true)
            
        }).responseJSON(completionHandler: {
            response in
            
            print(response)
        })
    }
    
    func logout () {
        
    }
    
    func kickout () {
        
    }
    
    func cleanCache () {
        
    }
}
