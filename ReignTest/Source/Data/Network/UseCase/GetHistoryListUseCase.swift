//
//  GetHistoryListUseCase.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit
import RxSwift

class GetHistoryListUseCase: NSObject {
    private let repository: HistoryRepository
    private let cacheManager: CacheManager
    
    init(repository: HistoryRepository, cacheManager: CacheManager) {
        self.repository = repository
        self.cacheManager = cacheManager
    }
    
    func getHistoryList(forceUpdate: Bool = false) -> Single<[History]> {
        return Single<[History]?>.create { [weak self] single in
            if (forceUpdate) {
                single(.success(nil))
            } else {
                let cacheHistorys = self?.cacheManager.getHistorys()
                if (cacheHistorys != nil && cacheHistorys!.count > 0) {
                    single(.success(cacheHistorys))
                } else {
                    single(.success(nil))
                }
            }
            
            return Disposables.create()
        }.flatMap {[weak self] cachedHistories -> Single<[History]> in
            if (self == nil) {
                return Single.never()
            }
            if (cachedHistories != nil) {
                return Single.just(cachedHistories!)
            } else {
                return self!.repository.listAll()
            }
        }.do(onSuccess: { [weak self] historyArray in
            self?.cacheManager.saveHistorys(histories: historyArray)
        })
    }
}
