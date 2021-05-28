//
//  Presenter.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Foundation
import UIKit

protocol Presenter: class {
    associatedtype View
    
    var view: View? { get set }
    
    func viewDidAttach()
    func viewDidDettach()
    
    func attachView(view: View)
    func dettachView()
}

extension Presenter {
    func attachView(view: View) {
        self.view = view
        self.viewDidAttach()
    }
    
    func dettachView() {
        self.view = nil
        self.viewDidDettach()
    }
}
