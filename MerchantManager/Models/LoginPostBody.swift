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
    var deviceToken: String = ""
    var mobileOS: String = "iOS"
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        username <- map["username"]
        password <- map["password"]
        deviceToken <- map["device_token"]
        mobileOS <- map["mobile_os"]
    }
}
