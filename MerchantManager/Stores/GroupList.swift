//
//  GroupList.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-18.
//  Copyright © 2017 richard. All rights reserved.
//

import Foundation


//Mark: Notifications
let requsetStoreDataCompleteNotification = "requsetStoreDataCompleteNotification"

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
            //should be logic to create store
            return;
        }
        
        let loadGroup = DispatchGroup()
        let moreinfoQueue = DispatchQueue (label: "com.load.moreinfo", attributes: .concurrent)
        
        //load data based on current store status
        if current.getStatus() == groupStstus.approved {
            
            loadGroup.enter()
            moreinfoQueue.async {
                StoreManager.shared.requestStoreData (completion: {
                    print("finish store")
                    loadGroup.leave()
                })
            }
            
            loadGroup.enter()
            moreinfoQueue.async {
                CategoryList.shared.requestCategoryListData (completion: {
                    print("finish category")
                    loadGroup.leave()
                })
            }
        } else {
            loadGroup.enter()
            moreinfoQueue.async {
                
            }
        }
        
        loadGroup.notify(queue: DispatchQueue.main, execute: {
            print("finished")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: requsetStoreDataCompleteNotification), object: nil)
        })
    }
}
