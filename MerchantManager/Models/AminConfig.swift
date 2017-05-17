//
//  AppConfig.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class AdminConfig {
    
    //Properties
    var key: String?
    var secret: String?
    var version: String?
    var tax_class: [TaxClass]?
}

/*
extension AdminConfig {
    convenience init(json: JSON) {
        self.init()
    }
}
 */
