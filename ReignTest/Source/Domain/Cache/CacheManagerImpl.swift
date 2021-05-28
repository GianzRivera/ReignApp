//
//  CacheManagerImpl.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit
import CoreData

class CacheManagerImpl: CacheManager {
    private let categoryCache = HistoryCache()
    
    func saveHistorys(histories: [History]) {
        categoryCache.saveHistorys(histories: histories)
    }
    
    func getHistorys() -> [History]? {
        return categoryCache.getHistories()
    }
}
