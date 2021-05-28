//
//  BaseCoordinator.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit
import RxSwift

class BaseCoordinator<Result> {
    var childCoordinators = [Any]()
    var navigationController: UINavigationController?
    
    @discardableResult func start() -> Observable<Result> {
        fatalError("Children should implement `start`.")
    }
    
    func free<T>(coordinator: BaseCoordinator<T>) {
        childCoordinators = childCoordinators.filter { $0 as AnyObject !== coordinator }
    }
    
    @discardableResult
    func coordinate<T>(coordinator: BaseCoordinator<T>) -> Observable<T> {
        childCoordinators.append(coordinator)
        return coordinator.start().do(onNext: { [weak self] _ in self?.free(coordinator: coordinator) })
    }
}
