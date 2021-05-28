//
//  HistoryCoordinator.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit
import RxSwift
import RxCocoa

class HistoryCoordinator: BaseCoordinator<Void> {
    private let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController) {
        super.init()
        self.navigationController = navigationController
    }
    
    @discardableResult
    override func start() -> Observable<Void> {
        let historyListViewController = HistoryListViewController()
        let getHistoryListUseCase = GetHistoryListUseCase(repository: RestHistoryRepository(), cacheManager: CacheManagerImpl())
        historyListViewController.presenter = HistoryPresenter(getHistoryListUseCase: getHistoryListUseCase)
        
        historyListViewController.coordinator = self
//        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(historyListViewController, animated: true)
        return Observable.merge(historyListViewController.rx.deallocated).take(1)
    }
}

extension HistoryCoordinator {
    
    func startDetails(url:String){
        let coordinator = HistoryDetailCoordinator(navigationController: self.navigationController!, navigationURL: url)
        coordinator.start()
    }
    
}
