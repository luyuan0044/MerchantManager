//
//  Address.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class Address: Mappable {
    var postal_code: String?
    var city: String?
    var street: String?
    var province: String?
    var country_code: String?
    var timezone: String?
    var latitude: Double?
    var longitude: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        postal_code <- map["postal_code"]
        city <- map["city"]
        street <- map["street"]
        province <- map["province"]
        country_code <- map["country_code"]
        timezone <- map["timezone"]
        latitude <- map["lat"]
        longitude <- map["lon"]
    }
}
