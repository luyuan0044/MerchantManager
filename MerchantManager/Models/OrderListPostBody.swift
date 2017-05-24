//
//  OrderListPostBody.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class OrderListPostBody : Mappable {
    
    var searchCondition: OrderListSearchCondition?
    
    init(searchCondition: OrderListSearchCondition) {
        self.searchCondition = searchCondition
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.searchCondition <- map["search_condition"]
    }
}
