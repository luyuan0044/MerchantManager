//
//  OauthKeyPair.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct OauthKeyPair : Mappable {
    
    //Properties
    var token: String?
    var token_secret: String?
    
    init(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        token <- map["token"]
        token_secret <- map["secret"]
    }
}
