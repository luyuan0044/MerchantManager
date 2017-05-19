//
//  GeneralInfo.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct GeneralInfo : Mappable {
    var name: [String: String]?
    var meta: String?
    var meta_keywords: String?
    var meta_title: String?
    var meta_desc: String?
    var tax_number: String?
    var currency: Int?
    var owner: String?
    var phone: String?
    var description: [String: String]?
    var website: String?
    var discount_info: String?
    var public_announcement: String?
    var language_list: [String]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        meta <- map["meta"]
        meta_keywords <- map["meta_keywords"]
        meta_title <- map["meta_title"]
        meta_desc <- map["meta_desc"]
        tax_number <- map["vat"]
        currency <- map["currency"]
        owner <- map["owner"]
        phone <- map["phone"]
        description <- map["description"]
        website <- map["url"]
        discount_info <- map["discount_info"]
        public_announcement <- map["public_announcement"]
        language_list <- map["language_list"]
    }
}
