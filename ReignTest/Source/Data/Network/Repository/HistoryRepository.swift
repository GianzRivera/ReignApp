//
//  HistoryRepository.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit
import RxSwift

protocol HistoryRepository {
    func listAll() -> Single<[History]>
}
