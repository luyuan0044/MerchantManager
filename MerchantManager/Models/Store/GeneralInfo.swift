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
    var metaKeywords: String?
    var metaTitle: String?
    var metaDesc: String?
    var taxNumber: String?
    var currency: Int?
    var owner: String?
    var phone: String?
    var description: [String: String]?
    var website: String?
    var discountInfo: String?
    var publicAnnouncement: String?
    var languageList: [String]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["store_nm"]
        meta <- map["store_meta"]
        metaKeywords <- map["meta_keywords"]
        metaTitle <- map["meta_title"]
        metaDesc <- map["meta_desc"]
        taxNumber <- map["vat"]
        currency <- map["currency"]
        owner <- map["owner"]
        phone <- map["phone"]
        description <- map["store_desc"]
        website <- map["url"]
        discountInfo <- map["store_di"]
        publicAnnouncement <- map["store_pa"]
        languageList <- map["lan_lst"]
    }
}
