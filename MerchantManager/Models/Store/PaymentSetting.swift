//
//  PaymentSetting.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct PaymentSetting : Mappable {
    var paypal: PaymentPaypal?
    var stripe: PaymentStripe?
    var wechat: PaymentWechat?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        paypal <- map["paypal"]
        stripe <- map["stripe"]
        wechat <- map["paypal"]
    }
}
