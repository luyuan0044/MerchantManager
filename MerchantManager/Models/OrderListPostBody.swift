//
//  OrderListPostBody.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class OrderListPostBody {
    
    var searchCondition: OrderListSearchCondition
    
    init(search_condition: OrderListSearchCondition) {
        self.searchCondition = search_condition
    }
}
