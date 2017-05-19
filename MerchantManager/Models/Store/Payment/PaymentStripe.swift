//
//  PaymentStripe.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct PaymentStripe : Mappable {
    var merchant_name: String?
    var api_key: String?
    var transaction_type: String?
    var card_types: [String]?
    var enable: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        merchant_name <- map["mch_nm"]
        api_key <- map["api_key"]
        transaction_type <- map["txn_type"]
        card_types <- map["card_types"]
        enable <- map["enabled"]
    }
}
