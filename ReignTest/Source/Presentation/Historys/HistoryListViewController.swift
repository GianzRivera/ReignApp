//
//  HistoryListViewController.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Foundation
import UIKit

class HistoryListViewController: UIViewController {
    
    public var presenter: HistoryPresenter?
    var historyView = HistoryListView()
    public var coordinator: HistoryCoordinator?
    
    var historyList: [History]? {
        didSet {
            historyView.tableView.reloadData()
        }
    }
    
    var showError: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(historyView)
        historyView.snp.remakeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        presenter?.attachView(view: self)
        
        historyView.tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier:"HistoryTableViewCell")

        historyView.tableView.dataSource = self
        historyView.tableView.delegate = self
        
        historyView.tableView.estimatedRowHeight = 65.adjusted
        historyView.tableView.rowHeight = UITableView.automaticDimension
        
        historyView.refreshControl.addTarget(self, action: #selector(self.onRefresh(_:)), for: .valueChanged)
        
        self.title = "History List"
    }
    
    deinit {
        presenter?.dettachView()
    }
    
    @objc
    private func onRefresh(_ sender: AnyObject) {
        self.presenter?.onPullToRefresh()
    }
    
    func hideRefreshLoading() {
        historyView.refreshControl.endRefreshing()
    }
    
    func getDateTimeDiff(dateInterval:Int) -> String {
        
        let dateStr = "\(NSDate(timeIntervalSince1970: TimeInterval(dateInterval)))"
        
        let formatter : DateFormatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

        let now = formatter.string(from: NSDate() as Date)
        let startDate = formatter.date(from: dateStr)
        let endDate = formatter.date(from: now)
        
        var calendar = NSCalendar.current
        
        let unitFlags = Set<Calendar.Component>([.year, .month, .day, .hour, .minute, .second])
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let dateComponents = calendar.dateComponents(unitFlags, from: startDate!, to: endDate!)
        
        let years = dateComponents.year!
        let months = dateComponents.month!
        let days = dateComponents.day!
        let hours = dateComponents.hour!
        let minutes = dateComponents.minute!
        let seconds = dateComponents.second!
        
        var timeAgo = ""
        
        if (seconds > 0){
            if seconds < 2 { timeAgo = "Second Ago" }
            else{ timeAgo = "\(seconds) Second Ago" }
        }
        
        if (minutes > 0){
            if minutes < 2 { timeAgo = "Minute Ago" }
            else{ timeAgo = "\(minutes) Minutes Ago" }
        }
        
        if(hours > 0){
            if hours < 2 { timeAgo = "Hour Ago" }
            else{ timeAgo = "\(hours) Hours Ago" }
        }
        
        if (days > 0) {
            if days < 2 { timeAgo = "Day Ago" }
            else{ timeAgo = "\(days) Days Ago" }
        }
        
        if(months > 0){
            if months < 2 { timeAgo = "Month Ago" }
            else{ timeAgo = "\(months) Months Ago" }
        }
        
        if(years > 0){
            if years < 2 { timeAgo = "Year Ago" }
            else{ timeAgo = "\(years) Years Ago"}
        }
        return timeAgo;
    }
}

extension HistoryListViewController: HistoryProtocol {
    func navigateDetail(url: String) {
        coordinator?.startDetails(url: url)
    }
}

extension HistoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyView.tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        cell.contentView.layoutIfNeeded()
        
        if let history = historyList?[indexPath.row] {
            cell.setupWith(title: history.commentText ?? "",
                           author: history.author ?? "",
                           time: getDateTimeDiff(dateInterval: history.createdAtI ?? 0))
        }

        return cell
    }
}

extension HistoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let history = historyList?[indexPath.row]{
            if let url = history.storyUrl {
                presenter?.showDetails(url: url)
            }
        }
    }
}
