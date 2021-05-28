//
//  HistoryDetailCoordinator.swift
//  ReignTest
//
//  Created by Gianz Rivera on 27/05/21.
//

import UIKit
import RxSwift
import RxCocoa

class HistoryDetailCoordinator: BaseCoordinator<Void> {
    private let disposeBag = DisposeBag()
    private var navigationURL = ""
    
    init(navigationController: UINavigationController, navigationURL:String ) {
        super.init()
        self.navigationController = navigationController
        self.navigationURL = navigationURL
    }
    
    @discardableResult
    override func start() -> Observable<Void> {
        let historyDetailVC = HistoryDetailViewController()
        historyDetailVC.navigationURL = self.navigationURL
        historyDetailVC.coordinator = self
        navigationController?.pushViewController(historyDetailVC, animated: true)
        return Observable.merge(historyDetailVC.rx.deallocated).take(1)
    }
}

extension HistoryCoordinator {
    
}
