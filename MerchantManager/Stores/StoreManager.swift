//
//  StoreManager.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire

class StoreManager {
    static var shared: StoreManager {
        return _shared
    }
    
    private static let _shared = StoreManager()
    
    private init() {
        
    }
    
    //Mark: Properties
    var current: Store?
    
    //Mark: Implementation
    func startRequest () {
       // Alamofire.request(., method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
    }
}
