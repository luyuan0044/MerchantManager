//
//  LoginPostBody.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginPostBody : Mappable {
    
    //Properties
    var username: String = ""
    var password: String = ""
    var device_token: String = ""
    var mobile_os: String = "iOS"
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        username <- map["username"]
        password <- map["password"]
        device_token <- map["device_token"]
        mobile_os <- map["mobile_os"]
    }
}

/*
extension LoginPostBody {
    convenience init(username: String, password: String) {
        self.init()
        
        self.username = username
        self.password = password
    }
    
    func toDictionary () -> Parameters {
        let result: Parameters = [
            "username": self.username,
            "password": self.password,
            "device_token": self.device_token,
            "mobile_os": self.mobile_os
        ]
        
        return result
    }
}
*/
