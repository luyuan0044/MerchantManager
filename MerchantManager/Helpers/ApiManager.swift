//
//  ApiManager.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-15.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import OAuthSwiftAlamofire
import OAuthSwift

class ApiManager {
    static var shared: ApiManager {
        return _shared
    }
    
    private static let _shared = ApiManager()
    
    private init() {
        
    }
    
    //Keypairs
    private var consumerKey = "8fb7ec71f8b4e1f2ec28d2f8c3f7785a"
    private var consumerSecret = "af035f0f340e090d5b51870f9a168acd"
    
    private var accessToken = ""
    private var accessTokenSecret = ""
    
    func setupOauthKeypair (_ oauthKeypair: OauthKeyPair) {
        accessToken = oauthKeypair.token!
        accessTokenSecret = oauthKeypair.tokenSecret!
    }
    
    var oauthClient: OAuthSwiftClient?
    func getOauthClient () -> OAuthSwiftClient {
        if oauthClient == nil {
            oauthClient = OAuthSwiftClient (consumerKey: consumerKey, consumerSecret: consumerSecret)
            oauthClient!.credential.oauthToken = accessToken
            oauthClient!.credential.oauthTokenSecret = accessTokenSecret
        }
        
        return oauthClient!
    }
    
    //Clean up access key pairs
    func cleanup () {
        accessToken = ""
        accessTokenSecret = ""
        oauthClient = nil
    }
}
