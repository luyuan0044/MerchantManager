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
    
    var all: [Order]?
    
    func LoadOrderList (_ force: Bool) -> [[Order]] {
        if force || all == nil {
            DispatchQueue.global().sync {
                if all == nil {
                    all = []
                }
                
                if let orders = startRequestDataFromServer() {
                    all!.append(contentsOf: orders)
                }
            }
        }
    
        return [all!]
    }
    
    func RefreshOrderList () -> [[Order]] {
        cleanCache()
        return LoadOrderList(true)
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
