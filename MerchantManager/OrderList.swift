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
    
    var saerchCondition = OrderListSearchCondition()
    
    var all: [Order]?
    
    func LoadOrderList (withCachedClear: Bool) -> [[Order]] {
        if withCachedClear {
            cleanCache()
        }
        
        if withCachedClear || all == nil {
            all = []
            
            DispatchQueue.global().sync {
                if let orders = startRequestDataFromServer() {
                    all!.append(contentsOf: orders)
                }
            }
        }
        
        return [all!]
    }
    
    func cleanCache() {
        pagingCtrl.reset()
        all = nil
    }
    
    func startRequestDataFromServer () -> [Order]? {
        var result: [Order]? = []
        
        result!.append(Order())
        result!.append(Order())
        
        sleep(3)
        
        return result
    }
}
