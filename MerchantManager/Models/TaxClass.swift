//
//  TaxClass.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct TaxClass : Mappable {
    
    //Properties
    var id: Int = -1
    var name: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["tax_class_name"]
    }
}

