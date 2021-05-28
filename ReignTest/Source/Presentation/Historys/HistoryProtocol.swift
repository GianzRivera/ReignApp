//
//  HistoryProtocol.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit

protocol HistoryProtocol {
    var historyList: [History]? { get set }
    var showError: Bool { get set }
    
    func hideRefreshLoading()
    func navigateDetail(url: String)
}
