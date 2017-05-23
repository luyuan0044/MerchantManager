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
    
    typealias extended = Bool
    
    typealias CellModel = (Category, extended)
    
    private var all: [Category]?
    
    private var categoriesOnView: [CellModel]? = nil
    
    //Mark: Implementation
    
    func requestCategoryListData (completion: @escaping () -> Void) {
        
        let oauthClient = ApiManager.shared.getOauthClient()
        let path = REST_PATH_CATEGORY
        
        oauthClient.request(path, method: .GET, parameters: [:], headers: [:], body: nil, checkTokenExpiration: false, success: {  response in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(String(describing: jsonObject))
                
                let response = ApiResponseList<Category> ()
                
                Mapper<ApiResponseList<Category>>().map(JSONObject: jsonObject, toObject: response)
                
                if response.getStatus() == apiStatus.success {
                    if self.all == nil {
                        self.all = []
                    }
                    
                    self.all!.append(contentsOf: response.records!)
                    
                    //test code
                    var testcategory = self.all!.filter({$0.id == 10190}).first
                    testcategory!.updateParent(id: 10185)
                    testcategory!.updateLevel()
                    self.all!.removeLast()
                    self.all!.append(testcategory!)
                    
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
    
    
    func getCategoriesOnView () -> [CellModel] {
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
                categoriesOnView!.append((category, false))
            }
            
            categoriesOnView!.sort(by: { $0.0.0.position < $0.1.0.position })
            
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
        categoriesOnView![toIndex].0.updatePosition(position: toIndex + 1)
        
        //update categories' position in the same level
        shiftCategoryPositions (fromIndex: fromIndex, toIndex: toIndex)
        
        debugPrintPosition ()
    }
    
    
    func extend (index: Int) -> Int {
        let cellModel = categoriesOnView![index]
        
        //find children
        let children = getChildrenCategoriesOf(categoryId: cellModel.0.id)
        
        //return when no children
        guard children.count > 0 else {
            return children.count
        }
        
        //update extend status
        categoriesOnView![index].1 = true
        
        var cellModelsToAdd : [CellModel] = []
        for child in children {
            cellModelsToAdd.append((child, false))
        }
        
        categoriesOnView!.insert(contentsOf: cellModelsToAdd, at: index + 1)
        
        debugPrintPosition ()
        
        return children.count
    }
    
    
    func collapse (index: Int) -> Int {
        //update extend status 
        categoriesOnView![index].1 = false
        
        let next = categoriesOnView!.filter({$0.0.level == categoriesOnView![index].0.level && $0.0.position > categoriesOnView![index].0.position}).first
        
        //calculate index of cellModels need to be removed
        let removeStartIndex = index + 1
        var removeEndIndex: Int = 0
        if let nextCellModel = next {
            let indexOfNextCellModel = categoriesOnView!.index(where: { $0.0.id == nextCellModel.0.id })
            
            if indexOfNextCellModel != nil {
                removeEndIndex = indexOfNextCellModel! - 1
            } else {
                removeEndIndex = categoriesOnView!.endIndex
            }
        }
        
        //remove range
        let range = removeStartIndex...removeEndIndex
        categoriesOnView!.removeSubrange(range)
        
        debugPrintPosition ()
        
        return removeEndIndex - removeStartIndex + 1
    }
    
    private func shiftCategoryPositions (fromIndex: Int, toIndex: Int) {
        if fromIndex < toIndex {
            //move down
            
            for index in fromIndex..<toIndex {
                categoriesOnView![index].0.updatePosition(shift: -1)
            }
        } else {
            //move up
            
            for index in toIndex + 1...fromIndex {
                categoriesOnView![index].0.updatePosition(shift: 1)
            }
        }
    }
    
    
    //Mark: Test log
    private func debugPrintPosition () {
        for cellModel in categoriesOnView! {
            let name = cellModel.0.name!["en"]
            
            if cellModel.0.level == 2 {
                print ("\(name!)")
            } else {
                print ("-\(name!)")
            }
        }
        
        print("=========")
    }
}
