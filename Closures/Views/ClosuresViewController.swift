//
//  ClosuresViewController.swift
//  Closures
//
//  Created by Onur Altintas on 13.05.2025.
//

import SnapKit
import UIKit
class ClosuresViewController: UIViewController {
    
    // MARK: Private Properties
    
    private lazy var fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch Data", for: .normal)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.text = "USERS"
        textView.font = .systemFont(ofSize: 17, weight: .bold)
        textView.textAlignment = .center
        return textView
    }()
    
    private lazy var usersTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        usersTableView.dataSource = self
        usersTableView.delegate = self
        setupLayouts()

    }
    
    // MARK: Private Functions
    
    private func setupLayouts() {
        view.addSubview(headerTextView)
        view.addSubview(fetchButton)
        view.addSubview(usersTableView)
        
        headerTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        fetchButton.snp.makeConstraints { make in
            make.top.equalTo(headerTextView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        usersTableView.snp.makeConstraints { make in
            make.top.equalTo(fetchButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
    }
    
    
    @objc private func handleTap() {
        print("Button Tapped!")
    }

}
 

extension ClosuresViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
    
}
