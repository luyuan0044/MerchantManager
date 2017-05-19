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
    var merchantName: String?
    var apiKey: String?
    var transactionType: String?
    var cardTypes: [String]?
    var enable: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        merchantName <- map["mch_nm"]
        apiKey <- map["api_key"]
        transactionType <- map["txn_type"]
        cardTypes <- map["card_types"]
        enable <- map["enabled"]
    }
}
