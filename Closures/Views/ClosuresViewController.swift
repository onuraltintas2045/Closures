//
//  ClosuresViewController.swift
//  Closures
//
//  Created by Onur Altintas on 13.05.2025.
//

import SnapKit
import UIKit
class ClosuresViewController: UIViewController {
    
    private let viewModel = ClosuresViewModel()
    
    // MARK: - UI Elements
    private lazy var fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch Data", for: .normal)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerLabel: UILabel = {
        let textView = UILabel()
        textView.textColor = .black
        textView.text = "USERS"
        textView.font = .systemFont(ofSize: 17, weight: .bold)
        textView.textAlignment = .center
        return textView
    }()
    
    private lazy var usersTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        usersTableView.dataSource = self
        usersTableView.delegate = self
        setupLayouts()
        bindViewModel()

    }
    
    private func bindViewModel() {
        viewModel.onUserUpdated = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.usersTableView.reloadData()
            }
        }
        
    }
    
    // MARK: - Layout
    private func setupLayouts() {
        view.addSubview(headerLabel)
        view.addSubview(fetchButton)
        view.addSubview(usersTableView)
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        fetchButton.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        usersTableView.snp.makeConstraints { make in
            make.top.equalTo(fetchButton.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    @objc private func handleTap() {
        viewModel.fetchUsers()
    }

}
 
// MARK: - UITableViewDataSource & Delegate
extension ClosuresViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = usersTableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.reuseIdentifier, for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(user: viewModel.users[indexPath.row])
        return cell
    }
    
    
}
