//
//  Store.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct Store: Mappable {
    var id: Int = 0
    var general_info: GeneralInfo?
    var menu_ids: [String]?
    var images: [String]?
    var hours: StoreHours?
    var store_address: Address?
    var store_flag: String?
    var ord_notification_setting: NotificationSetting?
    var printer_setting: PrinterSetting?
    var payment_setting: PaymentSetting?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        general_info <- map["general_info"]
        menu_ids <- map["menu_ids"]
        images <- map["images"]
        hours <- map["hours"]
        store_address <- map["store_addr"]
        store_flag <- map["store_flag"]
        ord_notification_setting <- map["ord_notification_setting"]
        printer_setting <- map["printer_setting"]
        payment_setting <- map["payment_setting"]
    }
}
