//
//  ApiResponse.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class ApiResponse<T> {
    
    //Properties
    var RC: Int?
    var records: T?
    var pagingOption: PagingOption?
}

//extension ApiResponse {
//    convenience init(json: JSON) {
//        self.init()
//    }
//}
