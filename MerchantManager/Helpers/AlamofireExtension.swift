//
//  AlamofireExtension.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire

extension Alamofire.Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint(self)
        #endif
        
        return self
    }
}
