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
    
    func LoadOrderList (completion: ([Order]) -> Void) {
        
    }
    
    func RefreshOrderList (completion: ([Order]) -> Void) {
        pagingCtrl.reset()
        LoadOrderList(completion: completion)
    }
    
    func cleanCache() {
        pagingCtrl.reset()
        all = []
    }
}
