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
    var phone_number: String?
    var country_code: String?
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        phone_number <- map["phone_number"]
        country_code <- map["country_code"]
    }
}

