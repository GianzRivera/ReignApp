//
//  CacheManager.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit
import RxSwift

protocol CacheManager {
    func saveHistorys(histories: [History])
    func getHistorys() -> [History]?
}
