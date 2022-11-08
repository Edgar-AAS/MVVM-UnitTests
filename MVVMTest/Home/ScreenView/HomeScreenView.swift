//
//  HomeScreenView.swift
//  MVVM-BackFront2
//
//  Created by Edgar Arlindo on 08/09/22.
//

import UIKit

class HomeScreenView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: "PersonCell")
        tableView.rowHeight = 165
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    public func reloadTableView() {
        tableView.reloadData()
    }

}

extension HomeScreenView: CodeView {
    func buildHierarchy() {
        self.addSubview(tableView)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
