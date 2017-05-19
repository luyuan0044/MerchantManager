//
//  PaymentWechat.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct PaymentWechat : Mappable {
    var appId: String?
    var merchantId: String?
    var enable: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        appId <- map["app_id"]
        merchantId <- map["mch_id"]
        enable <- map["enabled"]
    }
}
