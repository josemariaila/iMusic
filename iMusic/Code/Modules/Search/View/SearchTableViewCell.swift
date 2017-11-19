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
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var styleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 60.0)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
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
        
        nameLabel.text = viewModel.name
        styleLabel.text = viewModel.style
    }
}

private extension SearchTableViewCell {
    func initializeCell() {
        backgroundColor = AppColors.clear
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(styleLabel)
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0).isActive = true
        
        styleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.0).isActive = true
        styleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0).isActive = true
        styleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
        styleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0).isActive = true
    }
    
    func reset() {
        nameLabel.text = nil
        styleLabel.text = nil
    }
}
