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
    var app_id: String?
    var merchant_id: String?
    var enable: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        app_id <- map["app_id"]
        merchant_id <- map["mch_id"]
        enable <- map["enabled"]
    }
}
