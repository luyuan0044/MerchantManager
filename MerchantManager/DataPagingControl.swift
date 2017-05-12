//
//  DataPagingControl.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-11.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class DataPagingControl {
    
    var _pagingOption: PagingOption?
    var pagingOption: PagingOption? {
        get{
            return _pagingOption
        }
        set{
            _pagingOption = newValue
            
            if let _pagingOption = _pagingOption {
                //Update paging info
                current = _pagingOption.page
            }
        }
    }
    
    var inital: Bool = true
    
    var current: Int = 0
    
    var next: Int {
        get {
            return current + 1
        }
    }
    
    var max: Int {
        get {
            if let _pagingOption = _pagingOption {
                return _pagingOption.total / _pagingOption.perPage + 1
            }
            
            return 0
        }
    }
    
    var hasMore: Bool {
        get {
            return inital || current < max
        }
    }
    
    func reset() {
        inital = true
        _pagingOption = nil
        current = 0
    }
}
