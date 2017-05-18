//
//  OauthKeyPair.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class OauthKeyPair : Mappable {
    
    //Properties
    var key: String?
    var secret: String?
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        key <- map["key"]
        secret <- map["secret"]
    }
}
