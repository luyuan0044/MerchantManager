//
//  Profile.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class Profile : Mappable {
    
    var id: Int = -1
    var first_name: String?
    var last_name: String?
    var email: String?
    var phone: PhoneComponents?
    var stores: [StoreGroup]?
    var current_store: StoreGroup?
    var permission_level: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        email <- map["email"]
        phone <- map["phone"]
        stores <- map["g_ids"]
        current_store <- map["current_store"]
        permission_level <- map["permission_level"]
    }
}
