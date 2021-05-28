//
//  HistoryDetailView.swift
//  ReignTest
//
//  Created by Gianz Rivera on 27/05/21.
//

import Foundation
import UIKit
import SnapKit
import WebKit

class HistoryDetailView: UIView {
    
    var backgroundView = UIView()
    var wkWebView = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawViews()
    }
    
    init(){
        super.init(frame: CGRect.zero)
        self.drawViews()
    }
    
    func drawViews(){
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        self.addSubview(backgroundView)
    
        wkWebView = WKWebView()
        wkWebView.backgroundColor = .clear
        wkWebView.scrollView.backgroundColor = .clear
        self.addSubview(wkWebView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
            $0.bottom.equalTo(self.snp.bottom)
        }
        
        wkWebView.snp.remakeConstraints {
            if #available(iOS 11, *){
                $0.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            }else{
                $0.top.equalTo(self.snp.top)
                $0.bottom.equalTo(self.snp.bottom)
            }
            $0.left.equalTo(self.snp.left).offset(5.adjusted)
            $0.right.equalTo(self.snp.right).offset(-5.adjusted)
        }
        
        
        super.updateConstraints()
    }
    
}


