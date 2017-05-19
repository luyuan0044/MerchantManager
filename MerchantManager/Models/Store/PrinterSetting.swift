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
    var auto_print_smartprinter: Bool = false
    var auto_print_browswer: Bool = false
    var primary_language: String?
    var secondary_language: String?
    var printer_model: String?
    var username: String?
    var password: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        auto_print_smartprinter <- map["auto_print_sp"]
        auto_print_browswer <- map["auto_print_browswer"]
        primary_language <- map["sp_1st_lan"]
        secondary_language <- map["sp_2nd_lan"]
        printer_model <- map["sp_model"]
        username <- map["sp_user"]
        password <- map["sp_pass"]
    }
}
