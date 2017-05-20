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
    
    private var categoriesOnView: [Category]? = nil
    
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
    
    
    func getCategoriesOnView () -> [Category] {
        CategoryList.shared.constructCategoriesOnViewIfNeeded ()

        return categoriesOnView!
    }
    
    
    func constructCategoriesOnViewIfNeeded () {
        guard categoriesOnView == nil else {
            return;
        }
        
        if categoriesOnView == nil {
            categoriesOnView = []
        }
        
        if let root = getRootCategory () {
            let rootChildren = getChildrenCategoriesOf (categoryId: root.id)
            
            for child in rootChildren {
                let category = child
                categoriesOnView!.append(category)
            }
            
            categoriesOnView!.sort(by: { $0.0.position < $0.1.position })
            
            debugPrintPosition ()
        }
    }
    
    
    func getChildrenCategoriesOf (categoryId: Int) -> [Category] {
        return all!.filter({ $0.parentId == categoryId })
    }
    
    
    private func getRootCategory () -> Category? {
        return all!.filter({ $0.level == 1 }).first
    }
    
    
    func move (fromIndex: Int, toIndex: Int) {
        guard fromIndex != toIndex else {
            return
        }
        
        //move category
        let movedCategory = categoriesOnView![fromIndex]
        categoriesOnView!.remove(at: fromIndex)
        categoriesOnView!.insert(movedCategory, at: toIndex)
        
        //update moved category
        categoriesOnView![toIndex].updatePosition(position: toIndex + 1)
        
        //update categories' position in the same level
        shiftCategoryPositions (fromIndex: fromIndex, toIndex: toIndex)
        
        debugPrintPosition ()
    }
    
    private func shiftCategoryPositions (fromIndex: Int, toIndex: Int) {
        if fromIndex < toIndex {
            //move down
            
            for index in fromIndex..<toIndex {
                categoriesOnView![index].updatePosition(shift: -1)
            }
        } else {
            //move up
            
            for index in toIndex + 1...fromIndex {
                categoriesOnView![index].updatePosition(shift: 1)
            }
        }
    }
    
    private func debugPrintPosition () {
        for cate in categoriesOnView! {
            print(cate.position)
        }
    }
}
