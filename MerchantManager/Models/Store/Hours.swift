//
//  Hours.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct Hours : Mappable {
    var monday: String?
    var tuesday: String?
    var wednesday: String?
    var thursday: String?
    var friday: String?
    var saturday: String?
    var sunday: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        monday <- map["MON"]
        tuesday <- map["TUE"]
        wednesday <- map["WED"]
        thursday <- map["THU"]
        friday <- map["FRI"]
        saturday <- map["SAT"]
        sunday <- map["SUN"]
    }
}
