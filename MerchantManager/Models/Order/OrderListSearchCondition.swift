//
//  OrderListSearchCondition.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct OrderListSearchCondition : Mappable {
    
    //Properties
    var id: String?
    var status: Int = 0 //orderStatus..rawValue
    var sort: Int = 0
    var phone: String?
    var printed: Int = 0
    var startDate: String = "0"
    var endDate: String = "0"
    var minPrice: Double = -1
    var maxPrice: Double = -1
    var name: String?
    var shippingMethod: Int = 0
    var paging: PagingInfo?
    
    init () {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.status <- map["status"]
        self.sort <- map["sort"]
        self.paging <- map["paging"]
        self.printed <- map["printed"]
        self.startDate <- map["s_date"] //(map["s_date"], DateTransform())
        self.endDate <- map["e_date"] //(map["e_date"], DateTransform())
        self.name <- map["name"]
        self.shippingMethod <- map["s_method"]
        self.minPrice <- map["min_amt"]
        self.maxPrice <- map["maxPrice"]
    }
}

extension OrderListSearchCondition {
    mutating func setName (_ name: String) {
        self.name = name
    }
    
    mutating func setId (_ id: String) {
        self.id = id
    }
    
    mutating func setPhone (_ phone: String) {
        self.phone = phone
    }
    
    mutating func setStartDate (_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        self.startDate = dateFormatter.string(from: date)
    }
    
    mutating func setEndDate (_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        self.endDate = dateFormatter.string(from: date)
    }
    
    mutating func setShippingMethod (_ shippingMethod: shippingMethod) {
        self.shippingMethod = shippingMethod.rawValue
    }
    
    mutating func setPrintStatus () {
        
    }
    
    mutating func setAmountMin (_ amount: Double) {
        self.minPrice = amount
    }
    
    mutating func setAmountMax (_ amount: Double) {
        self.maxPrice = amount
    }
}
