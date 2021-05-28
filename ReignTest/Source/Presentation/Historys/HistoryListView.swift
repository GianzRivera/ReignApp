//
//  HistoryListView.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Foundation
import UIKit
import SnapKit

class HistoryListView: UIView {
    var backgroundView = UIView()
    var tableView = UITableView()
    var refreshControl = UIRefreshControl()
    
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
        
        tableView = UITableView()
        self.addSubview(tableView)
        
        refreshControl.tintColor = UIColor.black
        tableView.addSubview(refreshControl)
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
        
        tableView.snp.makeConstraints {
            if #available(iOS 11, *){
                $0.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            }else{
                $0.top.equalTo(self.snp.top)
                $0.bottom.equalTo(self.snp.bottom)
            }
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
        }
        
        super.updateConstraints()
    }
    
}


