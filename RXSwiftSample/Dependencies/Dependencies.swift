//
//  Dependencies.swift
//  samplerxswift
//
//  Created by phong070 on 14/07/2021.
//

import Foundation
final class Dependencies {
    static let instance : Dependencies = Dependencies()
    static var concurrentService : Concurrent = instance.concurrentObject
    
    private init() {
        
    }
    
    lazy var concurrentObject : Concurrent = {
       return ConcurrentImpt()
    }()
    
}
