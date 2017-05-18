//
//  LoginResponse.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse : Mappable {
    
    //Properties
    var profile: Profile?
    var oauth: OauthKeyPair?
    
    required init?(map: Map) {
       
    }
    
    func mapping(map: Map) {
        profile <- map["profile"]
        oauth <- map["oauth"]
    }
}
