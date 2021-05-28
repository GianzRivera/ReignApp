//
//  HistoryTableViewCell.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Foundation
import UIKit
import SnapKit

class HistoryTableViewCell: UITableViewCell {
    var containerView: UIView!
    var titleLabel: UILabel!
    var infoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }
    
    private func configure() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.numberOfLines = 2
        self.contentView.addSubview(titleLabel)
        
        infoLabel = UILabel()
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoLabel.textColor = UIColor.secondaryLabel
        self.contentView.addSubview(infoLabel)
        
        let margins: CGFloat = 16
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(margins)
            $0.trailing.equalToSuperview().offset(-margins)
            $0.top.equalToSuperview().offset(margins)
        }
        
        infoLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(margins)
            $0.trailing.equalToSuperview().offset(-margins)
            $0.top.equalTo(titleLabel.snp_bottomMargin).offset(16)
            $0.bottom.equalToSuperview().offset(-margins)
        }
    }
    
    func setupWith(title: String, author: String, time: String) {
        titleLabel.text = title
        infoLabel.text = "\(author) - \(time)"
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
