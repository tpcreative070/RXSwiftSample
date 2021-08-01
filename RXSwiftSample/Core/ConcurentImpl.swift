//
//  ConcurentImpl.swift
//  samplerxswift
//
//  Created by phong070 on 14/07/2021.
//

import RxSwift
class ConcurrentImpt : Concurrent {
    
    private var objectNotification : PublishSubject<Bool> = PublishSubject<Bool>()
    var onNotification: Observable<Bool>  {
        return objectNotification.asObservable()
    }
    
    func sendStatus(_ status: Bool) {
        objectNotification.onNext(status)
    }
    
}
