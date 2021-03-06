//
//  Category.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-19.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation
import ObjectMapper

struct Category : Mappable {
    
    var id: Int = 0
    var parentId: Int = 0
    var name: [String: String]?
    var level: Int = 0
    var position: Int = 0
    var path: String = ""
    var productCount: Int = 0
    var enable: Bool = false
    var publishedAt: Date?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["category_id"]
        parentId <- map["parent_id"]
        name <- map["name"]
        level <- map["level"]
        position <- map["position"]
        path <- map["path"]
        productCount <- map["product_count"]
        enable <- map["is_active"]
        publishedAt <- (map["published_at"], DateTransform())
    }
}

extension Category {
    
    mutating func updatePosition (position: Int) {
        self.position = position
        
        print("Move \(name?["en"]) to position \(self.position)")
    }
    
    mutating func updatePosition (shift: Int) {
        self.position += shift
        
        print("Shift \(name?["en"]) to position \(self.position)")
    }
    
    mutating func updatePath () {
        
    }
    
    mutating func updateParent (id: Int) {
        self.parentId = id
    }
    
    mutating func updateLevel () {
        self.level = 3
    }
}
