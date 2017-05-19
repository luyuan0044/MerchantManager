//
//  PrinterSetting.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct PrinterSetting : Mappable {
    var autoPrintSmartprinter: Bool = false
    var autoPrintBrowswer: Bool = false
    var primaryLanguage: String?
    var secondaryLanguage: String?
    var printerModel: String?
    var username: String?
    var password: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        autoPrintSmartprinter <- map["auto_print_sp"]
        autoPrintBrowswer <- map["auto_print_browswer"]
        primaryLanguage <- map["sp_1st_lan"]
        secondaryLanguage <- map["sp_2nd_lan"]
        secondaryLanguage <- map["sp_model"]
        username <- map["sp_user"]
        password <- map["sp_pass"]
    }
}
