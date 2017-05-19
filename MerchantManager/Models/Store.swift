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
    var generalInfo: GeneralInfo?
    var menuIds: [String]?
    var images: [String]?
    var hours: StoreHours?
    var storeAddress: Address?
    var storeFlag: String?
    var ordNotificationSetting: NotificationSetting?
    var printerSetting: PrinterSetting?
    var paymentSetting: PaymentSetting?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["g_id"]
        generalInfo <- map["general_info"]
        menuIds <- map["menu_ids"]
        images <- map["images"]
        hours <- map["hours"]
        storeAddress <- map["store_addr"]
        storeFlag <- map["store_flg"]
        ordNotificationSetting <- map["ord_notification_setting"]
        printerSetting <- map["printer_setting"]
        paymentSetting <- map["payment_setting"]
    }
}
