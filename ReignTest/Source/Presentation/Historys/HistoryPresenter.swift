//
//  HistoryPresenter.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import RxSwift

class HistoryPresenter: Presenter {
    var view: HistoryProtocol?
    
    let getHistoryListUseCase: GetHistoryListUseCase
    let disposeBag = DisposeBag()
    
    init(getHistoryListUseCase: GetHistoryListUseCase) {
        self.getHistoryListUseCase = getHistoryListUseCase
    }
    
    func getHistoryformation() {
        getHistoryListUseCase.getHistoryList().subscribe(
            onSuccess: { [weak self] (historyList) in
                self?.view?.historyList = historyList
            }, onError: { [weak self] error in
                self?.view?.showError = true
            })
        .disposed(by: disposeBag)
    }
    
    func viewDidAttach() {
        getHistoryformation()
    }
    
    func viewDidDettach() {
    }
    
    func showDetails(url:String){
        view?.navigateDetail(url: url)
    }
}

// MARK: - User input events
extension HistoryPresenter {
    func onPullToRefresh() {
        getHistoryListUseCase.getHistoryList(forceUpdate: true)
            .subscribe { [weak self] historyList in
                self?.view?.historyList = historyList
                self?.view?.hideRefreshLoading()
            } onError: { [weak self] _ in
                self?.view?.hideRefreshLoading()
            }
            .disposed(by: disposeBag)

    }
}
