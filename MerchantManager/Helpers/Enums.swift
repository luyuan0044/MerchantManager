//
//  Enums.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-13.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

enum orderStatus: Int {
    case pending = 1
    case processing
    case fraud
    case completed
    case canceled
    case closed
}

enum apiStatus: Int {
    case unknownError = 0
    
    case success = 200
    
    case invalidRequest = 400
    case accessDenied = 403
}

enum groupStstus: Int {
    case unknown = 0
    
    case pending = 1
    case rejected
    case approved
}

enum shippingMethod: Int {
    case unknown = 0
    
    case delivery = 1
    case pickup
    case eatin
    case flatrate
    case free //shipping not required
}
