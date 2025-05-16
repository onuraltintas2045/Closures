//
//  UsersTableViewCell.swift
//  Closures
//
//  Created by Onur Altintas on 15.05.2025.
//

import UIKit
import SnapKit

class UsersTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "UsersTableViewCell"
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private lazy var adLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private lazy var soyadLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private lazy var mailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
        contentView.addSubview(idLabel)
        contentView.addSubview(adLabel)
        contentView.addSubview(soyadLabel)
        contentView.addSubview(mailLabel)
        
        idLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        
        adLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        
        soyadLabel.snp.makeConstraints { make in
            make.top.equalTo(adLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        
        mailLabel.snp.makeConstraints { make in
            make.top.equalTo(soyadLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(30)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configure(user: User) {
        self.idLabel.text = user.picture.large
        self.adLabel.text = user.name.first
        self.soyadLabel.text = user.name.last
        self.mailLabel.text = user.email
    }


}
