//
//  OrderList.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-09.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

final class OrderList : CacheManageProtocal {
    
    static let shareInstance = OrderList()
    
    private init() {
        
    }
    
    var pagingCtrl = DataPagingControl ()
    
    private var _searchCondition = OrderListSearchCondition()
    var searchCondition: OrderListSearchCondition {
        get {
            return _searchCondition
        }
        set {
            searchConditionChanged = isSearchConditionChanged(newValue: newValue)
            
            if searchConditionChanged {
                _searchCondition = newValue
            }
        }
    }
    
    private var searchConditionChanged: Bool = false
    
    private var all: [Order]?
    
    func LoadOrderList (withCachedClear: Bool, completion: @escaping ([Order]) -> Void) {
        if withCachedClear {
            cleanCache()
        }
        
        let orderListGroup = DispatchGroup()
        
        if withCachedClear || all == nil {
            all = []
            
            orderListGroup.enter()
            DispatchQueue.global().async {
                self.startRequestDataFromServer(completion: { orders in
                    self.all!.append(contentsOf: orders)
                    orderListGroup.leave()
                })
            }
        }
        
        orderListGroup.notify(queue: DispatchQueue.main, execute: {
            completion (self.all!)
        })
    }
    
    
    func cleanCache() {
        pagingCtrl.reset()
        all = nil
    }
    
    
    func startRequestDataFromServer (completion: @escaping ([Order]) -> Void) {
        
        var orders : [Order] = []
        
        let oauthClient = ApiManager.shared.getOauthClient()
        let path = REST_PATH_ORDER_LIST
        
        let postBody = OrderListPostBody (searchCondition: self.searchCondition)
        print("\(postBody.toJSONString())")
        
        oauthClient.request(path, method: .POST, parameters: postBody.toJSON(), headers: ["Accept": "application/json", "Content-Type":"application/json"], body: nil, checkTokenExpiration: false, success: {  response in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print(String(describing: jsonObject))
                
                let response = ApiResponseList<Order> ()
                
                Mapper<ApiResponseList<Order>>().map(JSONObject: jsonObject, toObject: response)
                
                if response.getStatus() == apiStatus.success {
                    if self.all == nil {
                        self.all = []
                    }
                    
                    orders.append(contentsOf: response.records!)
                    
                } else {
                    
                }
            } catch {
                print (error)
            }
            
            completion(orders)
            
        }, failure: {
            response in
            
            print (response)
            
            completion(orders)
        })
    }
    
    
    func isSearchConditionChanged () -> Bool {
        return searchConditionChanged
    }
    
    func setSearchStatus (status: Int) {
        self._searchCondition.status = status
    }
    
    private func isSearchConditionChanged (newValue: OrderListSearchCondition) -> Bool {
        let notChange = self._searchCondition.id == newValue.id
            && self._searchCondition.name == newValue.name
            && self._searchCondition.phone == newValue.phone
            && self._searchCondition.shippingMethod == newValue.shippingMethod
            && self._searchCondition.printed == newValue.printed
            && self._searchCondition.startDate == newValue.startDate
            && self._searchCondition.endDate == newValue.endDate
            && self._searchCondition.minPrice == newValue.minPrice
            && self._searchCondition.maxPrice == newValue.maxPrice
        
        return !notChange
    }
}
