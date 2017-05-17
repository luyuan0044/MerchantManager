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
    var ord_id: String?
    var status: Int = orderStatus.pending.rawValue
    var sort: Int?
    var phone: String?
    var printed: Bool = false
    var s_date: NSDate?
    var e_date: NSDate?
    var min_amt: Double?
    var max_amt: Double?
    var name: String?
    var s_method: Int?
    
    override init() {
        super.init()
    }
}
