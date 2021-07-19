//
//  MainViewModel.swift
//  samplerxswift
//
//  Created by phong070 on 14/07/2021.
//

import Foundation

class MainViewModel  : BaseViewModel{
    override init() {
      super.init()
      self.initObserver()
    }
    
    private func initObserver(){
        let concurrent : Concurrent = Dependencies.concurrentService
        concurrent.onNotification.subscribe(onNext:{ [weak self] data in
            print("Value \(data)")
        }).disposed(by: disbag)
        concurrent.sendStatus(true)
    }
}
 
