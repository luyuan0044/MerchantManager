//
//  OrderListPostBody.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class OrderListPostBody {
    
    var search_condition: OrderListSearchCondition
    
    init(search_condition: OrderListSearchCondition) {
        self.search_condition = search_condition
    }
}
