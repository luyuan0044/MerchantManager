//
//  ApiResponse.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Freddy

final class ApiResponse {
    
    //Properties
    var RC: apiStatus = apiStatus.unknownError
    var records: AnyObject?
    var pagingOption: PagingOption?
}


extension ApiResponse : JSONDecodable {
    convenience init(json: JSON) throws {
        self.init()
        
        let rcInt = try json.getInt(at: "RC")
        RC = apiStatus(rawValue: rcInt)!
        records = try json.getan
    }
}
