//
//  AppConfig.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct AdminConfig : Mappable {
    
    //Properties
    var consumerKey: String = ""
    var consumerSecret: String = ""
    var version: String?
    var tax_class: [TaxClass]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        consumerKey <- map["key"]
        consumerSecret <- map["secret"]
        version <- map["bv"]
        tax_class <- map["tax_class"]
    }
}

