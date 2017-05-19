//
//  PaymentPaypal.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct PaymentPaypal : Mappable {
    var merchant_name: String?
    var merchant_phone: String?
    var partner: String?
    var merchant_login_name: String?
    var username: String?
    var password: String?
    var transaction_type: String?
    var card_types: [String]?
    var enable: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        merchant_name <- map["mch_nm"]
        merchant_phone <- map["mch_phone"]
        partner <- map["partner"]
        merchant_login_name <- map["mch_login"]
        username <- map["api_user"]
        password <- map["api_pass"]
        transaction_type <- map["txn_type"]
        card_types <- map["card_types"]
        enable <- map["enabled"]
    }
}
