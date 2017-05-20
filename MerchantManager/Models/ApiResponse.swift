//
//  ApiResponse.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiResponse <T: Mappable> : Mappable {
    
    //Properties
    var RC: Int = 0
    var pagingOption: PagingOption?
    var records: T?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        RC <- map["RC"]
        pagingOption <- map["pagingOption"]
        records <- map["records"]
    }
}

extension ApiResponse {
    func getStatus () -> apiStatus {
        return apiStatus (rawValue: RC)!
    }
}

class ApiResponseList <T: Mappable> : Mappable {
    
    //Properties
    var RC: Int = 0
    var pagingOption: PagingOption?
    var records: [T]?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        RC <- map["RC"]
        pagingOption <- map["pagingOption"]
        records <- map["records"]
    }
}

extension ApiResponseList {
    func getStatus () -> apiStatus {
        return apiStatus (rawValue: RC)!
    }
}
