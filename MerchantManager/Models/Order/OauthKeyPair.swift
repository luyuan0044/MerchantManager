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
    var tokenSecret: String?
    
    init(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        token <- map["token"]
        tokenSecret <- map["secret"]
    }
}
