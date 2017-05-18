//
//  AppConfig.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Freddy

final class AdminConfig {
    
    //Properties
    var key: String?
    var secret: String?
    var version: String?
    var tax_class: [TaxClass]?
}


extension AdminConfig : JSONDecodable {
    convenience init(json: JSON) throws {
        self.init()
        
        key = try json.getString(at: "name")
        secret = try json.getString(at: "name")
        version = try json.getString(at: "name")
        tax_class = try json.getArray(at: "tax_class").map(TaxClass.init)
    }
}

