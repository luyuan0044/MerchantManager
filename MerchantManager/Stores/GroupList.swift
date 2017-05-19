//
//  GroupList.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation

class GroupList : CacheManageProtocal {
    //Mark: Singleton
    
    static var shared: GroupList {
        return _shared
    }
    
    private static let _shared = GroupList()
    
    private init() {
        
    }
    
    //Mark: Properties
    
    var all: [StoreGroup]?
    
    var currentId: Int?
    
    var current: StoreGroup? {
        get {
            if self.all == nil  {
                return nil
            }
            
            if let currId = currentId {
                return self.all!.filter ({$0.id == currId}).first
            }
            
            return nil
        }
    }
    
    //Mark: Implementation
    
    func switchGroup (id: Int) {
        if all == nil {
            return
        }
        
        if let _ = all!.filter({$0.id == id}).first {
            self.currentId = id
            
            loadInitalData ()
        }
    }
    
    func setGroups (_ groups: [StoreGroup]?) {
        all = groups
    }
    
    func cleanCache() {
        currentId = nil
    }
    
    private func loadInitalData () {
        guard let current = self.current else {
            return;
        }
        
        let moreinfoQueue = DispatchQueue (label: "com.load.moreinfo", attributes: .concurrent)
        
        //load data based on current store status
        if current.getStatus() == groupStstus.approved {
            moreinfoQueue.async {
                StoreManager.shared.requestStoreData ()
                
            }
        } else {
            moreinfoQueue.async {
                
            }
        }
    }
}
