//
//  CombineLatestVC+ViewFactory.swift
//  samplerxswift
//
//  Created by phong070 on 01/08/2021.
//

import UIKit
import SnapKit
extension CombineLatestVC {
    func initUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-50)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(100)
        }
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(passwordTexField)
        stackView.addArrangedSubview(actionButton)
    }
}
