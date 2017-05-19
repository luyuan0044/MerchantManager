//
//  NotificationSetting.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct NotificationSetting : Mappable {
    var notify_by_email: Bool = false
    var email: [String] = []
    var notify_by_text: Bool = false
    var phone: [PhoneComponents] = []
    var notify_by_push_notification: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        notify_by_email <- map["notify_by_email"]
        email <- map["email"]
        notify_by_text <- map["notify_by_text"]
        phone <- map["phone"]
        notify_by_push_notification <- map["notify_by_push"]
    }
}
