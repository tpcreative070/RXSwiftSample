//
//  CombineLatestVC.swift
//  samplerxswift
//
//  Created by phong070 on 01/08/2021.
//

import UIKit
import RxSwift
import RxCocoa
class CombineLatestVC : UIViewController {
    
    lazy var userNameTextField : UITextField = {
        let view = UITextField()
        view.placeholder = "Enter username"
        return view
    }()
    
    lazy var passwordTexField : UITextField = {
        let view = UITextField()
        view.placeholder = "Enter password"
        return view
    }()
    
    lazy var actionButton : UIButton = {
        let view = UIButton()
        view.setTitle("Send", for: .normal)
        return view
    }()
    
    lazy var stackView : UIStackView  = {
        let view  = UIStackView()
        view.alignment = .fill
        view.axis = .vertical
        view.spacing = 20
        view.distribution = .equalSpacing
        return view
    }()
    
    private let disbag = DisposeBag()
    private let isEnableBinding : BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        Observable.combineLatest(userNameTextField.rx.text.orEmpty, passwordTexField.rx.text.orEmpty)
            .map { userName, password -> Bool in
                print("Value \(userName) \(password)")
                return userName.count > 4 && password.count > 6
            }
            .bind(to: isEnableBinding)
            .disposed(by:disbag)
        isEnableBinding.do(onNext : { [weak self] isEnabled in
            guard let self = self else {return}
            self.actionButton.backgroundColor = isEnabled ? .systemOrange : .lightGray
                           self.actionButton.isEnabled = isEnabled
        })
            .subscribe()
            .disposed(by: disbag)
    }
}
