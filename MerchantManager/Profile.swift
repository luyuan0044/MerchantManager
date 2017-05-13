//
//  Profile.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class Profile {
    
    var id: Int = -1
    var first_name: String?
    var last_name: String?
    var email: String?
    var phone: PhoneComponents?
    var groups: [StoreGroup]?
    var current_group_id: Int?
    var permission_level: Int?
}

extension Profile {
    convenience init(json: JSON) throws {
        self.init()
        
        if let json = json {
            print(json)
        }
    }
}
