//
//  StoreHours.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct StoreHours: Mappable {
    var open: Hours?
    var delivery: Hours?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        open <- map["open"]
        delivery <- map["delivery"]
    }
}
