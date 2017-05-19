//
//  OrderListSearchCondition.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class OrderListSearchCondition : PagingInfo {
    
    //Properties
    var ordId: String?
    var status: Int = orderStatus.pending.rawValue
    var sort: Int?
    var phone: String?
    var printed: Bool = false
    var startDate: NSDate?
    var endDate: NSDate?
    var minPrice: Double?
    var maxPrice: Double?
    var name: String?
    var shippingMethod: Int?
    
    override init() {
        super.init()
    }
}
