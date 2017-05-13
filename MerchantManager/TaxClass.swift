//
//  TaxClass.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class TaxClass {
    
    //Properties
    var id: Int = -1
    var name: String?
}

extension TaxClass {
    convenience init(json: JSON) throws {
        self.init()
        
        if let json = json {
            print(json)
        }
    }
}
