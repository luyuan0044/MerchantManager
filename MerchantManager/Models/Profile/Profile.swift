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
    var id: Int = 0
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: PhoneComponents?
    var stores: [StoreGroup]?
    var currentStore: StoreGroup?
    var permissionLevel: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        email <- map["email"]
        phone <- map["phone"]
        stores <- map["g_ids"]
        currentStore <- map["current_store"]
        permissionLevel <- map["permission_level"]
    }
}
