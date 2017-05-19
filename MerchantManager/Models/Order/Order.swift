//
//  Order.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class Order {
    
    var id: Int = -1
    var status: Int = -1
    var shippingMethod: Int = -1
    var paymentMethod: Int = -1
    var createAt: NSDate?
    var total: Double?
    var billTo: String?
    var shipTo: String?
    var storeName: String?
    var phone: String?
    var email: String?
    var address: String?
    var table: String?
    var expectDate: NSDate?
}

/*
extension Order {
    convenience init(json: JSON) throws {
        self.init()
        
        if let json = json {
            print(json)
        }
    }
}
*/
