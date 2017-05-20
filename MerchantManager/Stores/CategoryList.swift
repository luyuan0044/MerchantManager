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
    
    func requestCategoryListData (completion: @escaping () -> Void) {
        
        let oauthClient = ApiManager.shared.getOauthClient()
        let path = REST_PATH_CATEGORY
        
        oauthClient.request(path, method: .GET, parameters: [:], headers: [:], body: nil, checkTokenExpiration: false, success: {  response in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(jsonObject)
                
                let response = ApiResponseList<Category> ()
                
                Mapper<ApiResponseList<Category>>().map(JSONObject: jsonObject, toObject: response)
                
                if response.getStatus() == apiStatus.success {
                    if self.all == nil {
                        self.all = []
                    }
                    
                    self.all!.append(contentsOf: response.records!)
                } else {
                    
                }
            } catch {
                print (error)
            }
            
            completion()
            
        }, failure: {
            response in
            
            print (response)
            
            completion()
        })
    }
    
    func getAllCategories () -> [Category] {
        return all!
    }
    
    func startEdit () {
        
    }
}
