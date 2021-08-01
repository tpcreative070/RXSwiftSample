//
//  MainViewModel.swift
//  samplerxswift
//
//  Created by phong070 on 14/07/2021.
//

import Foundation
import RxSwift
class MainViewModel  : BaseViewModel{
    private let data = [Main(id: 1, name: "CombineLatest"),Main(id: 2, name: "FlatMap & FlatMapLatest")]
    private var interalData : PublishSubject = PublishSubject<[Main]>()
    var onData : Observable<[Main]> {
        return interalData.asObserver()
    }
    
    override init() {
      super.init()
      self.initObserver()
    }
    
    private func initObserver(){
        let concurrent : Concurrent = Dependencies.concurrentService
        concurrent.onNotification.subscribe(onNext:{ [weak self] data in
            self?.log(any: "Value \(data)")
        }).disposed(by: disbag)
        concurrent.sendStatus(true)
    }
    
    func getData(){
        interalData.onNext(data)
    }
}
 
