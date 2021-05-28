//
//  HistoryDetailViewController.swift
//  ReignTest
//
//  Created by Gianz Rivera on 27/05/21.
//

import Foundation
import UIKit

class HistoryDetailViewController: UIViewController {
//    public var presenter: HistoryPresenter?
    var historyDetailView = HistoryDetailView()
    public var coordinator: HistoryDetailCoordinator?
    var navigationURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(historyDetailView)
        historyDetailView.snp.remakeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        self.historyDetailView.wkWebView.scrollView.minimumZoomScale = 1
        self.historyDetailView.wkWebView.scrollView.maximumZoomScale = 1
        let url = URL(string: self.navigationURL)
        self.historyDetailView.wkWebView.load(URLRequest(url: url!))

        self.title = "Details"
    }
    
    deinit {
//        presenter?.dettachView()
    }
    
    
}
