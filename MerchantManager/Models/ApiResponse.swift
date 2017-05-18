//
//  ApiResponse.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import SwiftyJSON

class ApiResponse {
    
    //Properties
    var RC: apiStatus = apiStatus.unknownError
    var records: AnyObject?
    var pagingOption: PagingOption?
}

extension ApiResponse {
    convenience init(_ json: JSON?) {
        self.init()
        
        if let json = json {
            if let status = apiStatus(rawValue:  json["RC"].intValue) {
                self.RC = status
            }
            
            self.pagingOption = PagingOption (json: json["paging"])
            
            if let jsonDict = json["records"].dictionary {
                
            }
            else if let jsonArray = json["records"].array{
                
            }
        }
    }
}
