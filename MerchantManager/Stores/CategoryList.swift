//
//  CategoryList.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-19.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoryList {
    static var shared: CategoryList {
        return _shared
    }
    
    private static let _shared = CategoryList()
    
    private init () {
        
    }
    
    //Mark: Properties
    
    private var all: [Category]?
    
    //Mark: Implementation
    
    func requestCategoryListData () {
        
        let oauthClient = ApiManager.shared.getOauthClient()
        let path = BASE_URL.appendingPathComponent(REST_PATH_CATEGORY)
        
        oauthClient.request(path.absoluteString, method: .GET, parameters: [:], headers: [:], body: nil, checkTokenExpiration: false, success: {
            response in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                let categoryList = Mapper<ApiResponse<Category>>.init().map(JSON: jsonObject as! [String: AnyObject])
                
            } catch {
                print (error)
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: requsetStoreDataCompleteNotification), object: nil)
            
        }, failure: {
            response in
            
            print (response)
        })
    }
}
