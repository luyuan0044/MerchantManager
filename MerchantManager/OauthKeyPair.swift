//
//  OauthKeyPair.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class OauthKeyPair {
    
    //Properties
    var key: String?
    var secret: String?
}

extension OauthKeyPair {
    convenience init(json: JSON) {
        self.init()
    }
}
