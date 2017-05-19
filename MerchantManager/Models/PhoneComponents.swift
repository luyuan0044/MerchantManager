//
//  PhoneComponents.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class PhoneComponents : Mappable {
    
    //Properties
    var phoneNumber: String?
    var countryCode: String?
    var areaCode: String?
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        phoneNumber <- map["phone_number"]
        countryCode <- map["country_code"]
        areaCode <- map["area_code"]
    }
}
