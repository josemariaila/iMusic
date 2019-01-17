//
//  SearchTableViewCell.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    static var cellIdentifier: String = "SearchTableViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 60.0)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
}

extension SearchTableViewCell {
    func configure(viewModel: SearchCellViewModel?) {
        guard let viewModel = viewModel else {
            reset()
            return
        }
        
        titleLabel.text = viewModel.title
    }
}

private extension SearchTableViewCell {
    func initializeCell() {
        backgroundColor = UIColor.white
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
                                     titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0),
                                     titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0),
                                     titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0)])
    }
    
    func reset() {
        titleLabel.text = nil
    }
}
