//
//  LoginPostBody.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-12.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire

class LoginPostBody {
    
    //Properties
    var username: String = ""
    var password: String = ""
    var device_token: String = ""
    var mobile_os: String = "iOS"
}

extension LoginPostBody {
    convenience init(username: String, password: String) {
        self.init()
        
        self.username = username
        self.password = password
    }
    
    func toDictionary () -> Parameters {
        let result: Parameters = [
            "username": self.username,
            "password": self.password,
            "device_token": self.device_token,
            "mobile_os": self.mobile_os
        ]
        
        return result
    }
}
