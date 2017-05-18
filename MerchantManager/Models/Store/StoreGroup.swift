//
//  StoreGroup.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class StoreGroup : Mappable {
    
    //Properties
    var id: Int?
    var name: String?
    var status: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        status <- map["status"]
    }
}
