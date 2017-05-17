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
    var shipping_method: Int = -1
    var payment_method: Int = -1
    var create_at: NSDate?
    var total: Double?
    var bill_to: String?
    var ship_to: String?
    var store_name: String?
    var phone: String?
    var email: String?
    var address: String?
    var table: String?
    var expect_date: NSDate?
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
