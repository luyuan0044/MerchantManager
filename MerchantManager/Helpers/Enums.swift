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
    case accessDenied = 403
}
