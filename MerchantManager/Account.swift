//
//  Account.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class Account {
    
    var id: Int = -1
    var first_name: String?
    var last_name: String?
    var username: String?
    var email: String?
    var phone: String?
    var country_code: String?
    var group_ids: [Int]?
    var current_group_id: Int?
    var permission_level: Int?
}

extension Account {
    convenience init(json: JSON) throws {
        self.init()
        
        if let json = json {
            print(json)
        }
    }
}
