//
//  BaseViewModel.swift
//  samplerxswift
//
//  Created by phong070 on 14/07/2021.
//

import RxSwift
class BaseViewModel {
    let disbag : DisposeBag = DisposeBag()
    init() {
        
    }
    
    func log(any : Any){
        print(any)
    }
}
