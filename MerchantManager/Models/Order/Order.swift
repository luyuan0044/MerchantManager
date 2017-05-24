//
//  Order.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class Order : Mappable {
    
    var id: String = ""
    var status: Int = -1
    var shippingMethod: Int = -1
    var paymentMethod: Int = -1
    var createAt: Date?
    var total: Double?
    var customer_name: String?
    var phone: String?
    var email: String?
    var address: Address?
    var table: String?
    var expectDate: Date?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["ord_id"]
        status <- map["status"]
        createAt <- (map["ord_dt"], DateTransform())
        total <- map["ord_total"]
        customer_name <- map["c_name"]
        phone <- map["phone"]
        address <- map["address"]
        table <- map["table"]
        shippingMethod <- map["s_method"]
        paymentMethod <- map["p_method"]
        email <- map["email"]
        expectDate <- (map["exp_dt"], DateTransform())
    }
}
