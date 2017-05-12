//
//  OrderList.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-09.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class OrderList : CacheManageProtocal {
    
    static let shareInstance = OrderList()
    
    var pagingCtrl = DataPagingControl ()
    
    var all: [Order] = []
    
    func LoadOrderList (completion: ([[Order]]) -> Void) {
        startRequestDataFromServer (completion: { orders in
            all.append(contentsOf: orders)
            
            var result: [[Order]] = [[]]
            result.append(self.all)
            completion(result)
        })
    }
    
    func RefreshOrderList (completion: ([[Order]]) -> Void) {
        pagingCtrl.reset()
        LoadOrderList(completion: completion)
    }
    
    func cleanCache() {
        pagingCtrl.reset()
        all = []
    }
    
    private func startRequestDataFromServer (completion: ([Order]) -> Void) {
        var result: [Order] = []
        
        result.append(Order())
        result.append(Order())
        
        completion (result)
    }
}
