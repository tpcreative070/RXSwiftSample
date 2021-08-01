//
//  BaseViewControlelr.swift
//  RXSwiftSample
//
//  Created by phong070 on 01/08/2021.
//

import UIKit
import RxSwift

class BaseViewController : UIViewController {
    let disbag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func log(any : Any){
        print(any)
    }
}
