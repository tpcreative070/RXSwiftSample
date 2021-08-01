//
//  MainVC+ViewFactory.swift
//  RXSwiftSample
//
//  Created by phong070 on 01/08/2021.
//

import UIKit
import SnapKit

extension MainVC {
    func initUI(){
        setUpConstraintButton()
        setUpConstraintTableView()
    }
    
    private func setUpConstraintButton(){
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(50)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(50)
        }
        stackView.addArrangedSubview(throttleButton)
        stackView.addArrangedSubview(debounceButton)
    }
    
    private func setUpConstraintTableView(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.leading.equalTo(self.view).offset(0)
            make.trailing.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
}
