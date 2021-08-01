//
//  Concurrent.swift
//  samplerxswift
//
//  Created by phong070 on 14/07/2021.
//

import RxSwift
protocol Concurrent {
    var onNotification : Observable<Bool> {get}
    func sendStatus(_ status : Bool)
}
