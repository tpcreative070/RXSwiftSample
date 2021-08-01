//
//  FlatMapFlatMapLatestVC.swift
//  RXSwiftSample
//
//  Created by phong070 on 01/08/2021.
//

import UIKit
import RxSwift
import RxCocoa
class FlatMapFlatMapLatestVC : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        flatMap()
        flatMapLatest()
        flatMapFirst()
    }
    
    func flatMap(){
        let student1 = Student(name: "A", score: BehaviorRelay(value: 10))
        let student2 = Student(name: "B", score: BehaviorRelay(value :20))
        let student3 = Student(name: "C", score: BehaviorRelay(value : 30))
        Observable.of(student1,student2,student3)
            .flatMap { value -> BehaviorRelay in
                return value.score
            }
            .subscribe(onNext : { [weak self] data in
                guard let self = self else {return}
                self.log(any: "Flatmap \(data)")
            })
            .disposed(by: disbag)
        student1.score.accept(40)
        student2.score.accept(50)
        student3.score.accept(60)
        
        /*
         output
           10,
           20,
           30,
           40,
           50,
           60
         */
    }
    
    func flatMapLatest(){
        let student1 = Student(name: "A", score: BehaviorRelay(value: 10))
        let student2 = Student(name: "B", score: BehaviorRelay(value :20))
        let student3 = Student(name: "C", score: BehaviorRelay(value : 30))
        Observable.of(student1,student2,student3)
            .flatMapLatest { value -> BehaviorRelay in
                return value.score
            }
            .subscribe(onNext : { [weak self] data in
                guard let self = self else {return}
                self.log(any: "Flatmap Latest \(data)")
            })
            .disposed(by: disbag)
        student1.score.accept(40)
        student2.score.accept(50)
        student3.score.accept(60)
        
        /*
         output
           10,
           20,
           30,
           60
         */
    }
    
    func flatMapFirst(){
        let student1 = Student(name: "A", score: BehaviorRelay(value: 10))
        let student2 = Student(name: "B", score: BehaviorRelay(value :20))
        let student3 = Student(name: "C", score: BehaviorRelay(value : 30))
        Observable.of(student1,student2,student3)
            .flatMapFirst { value -> BehaviorRelay in
                return value.score
            }
            .subscribe(onNext : { [weak self] data in
                guard let self = self else {return}
                self.log(any: "Flatmap First \(data)")
            })
            .disposed(by: disbag)
        student1.score.accept(40)
        student2.score.accept(50)
        student3.score.accept(60)
        
        /*
         output
           10,
           60
         */
    }
}
struct Student {
    var name : String
    var score : BehaviorRelay<Int>
}
