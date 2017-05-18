//
//  TaxClass.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Freddy

final class TaxClass {
    
    //Properties
    var id: Int = -1
    var name: String?
}


extension TaxClass : JSONDecodable {
    convenience init(json: JSON) throws {
        self.init()
        
        id = try json.getInt(at: "id")
        name = try json.getString(at: "name")
    }
}

