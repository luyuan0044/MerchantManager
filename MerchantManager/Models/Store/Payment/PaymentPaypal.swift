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
    var merchantName: String?
    var merchantPhone: String?
    var partner: String?
    var merchantLoginName: String?
    var username: String?
    var password: String?
    var transactionType: String?
    var cardTypes: [String]?
    var enable: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        merchantName <- map["mch_nm"]
        merchantPhone <- map["mch_phone"]
        partner <- map["partner"]
        merchantLoginName <- map["mch_login"]
        username <- map["api_user"]
        password <- map["api_pass"]
        transactionType <- map["txn_type"]
        cardTypes <- map["card_types"]
        enable <- map["enabled"]
    }
}
