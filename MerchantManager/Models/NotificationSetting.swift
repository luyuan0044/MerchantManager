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
    var notifyByEmail: Bool = false
    var email: [String] = []
    var notifyByText: Bool = false
    var phone: [PhoneComponents] = []
    var notifyByPushNotification: Bool = false
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        notifyByEmail <- map["notify_by_email"]
        email <- map["email"]
        notifyByText <- map["notify_by_text"]
        phone <- map["phone"]
        notifyByPushNotification <- map["notify_by_push"]
    }
}
