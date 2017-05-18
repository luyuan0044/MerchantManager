//
//  PagingOption.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class PagingOption: NSObject {
    
    //Properties
    var page: Int = 0
    var perPage: Int = 0
    var pageStart: Int = 0
    var pageEnd: Int = 0
    var total: Int = 0
}

/*
extension PagingOption {
    convenience init(json: JSON?) {
        self.init()
        
        if let json = json {
            self.page = json["page"].intValue
            self.perPage = json["perPage"].intValue
            self.pageStart = json["pageStart"].intValue
            self.pageEnd = json["pageEnd"].intValue
            self.total = json["total"].intValue
        }
    }
}
*/
