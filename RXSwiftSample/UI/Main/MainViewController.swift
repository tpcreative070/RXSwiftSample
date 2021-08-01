//
//  ViewController.swift
//  samplerxswift
//
//  Created by phong070 on 05/07/2021.
//

import UIKit
import RxSwift
class MainViewController: UIViewController {
    var viewModel : MainViewModel!
    
    @IBOutlet weak var throttleButton : UIButton!
    @IBOutlet weak var debounceButton : UIButton!
    private let disbag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        
        throttleButton.rx.tap.asDriver()
            .throttle(.seconds(2))
            .asObservable()
            .subscribe(onNext  :{ [weak self ] value in
                guard let self = self else {return}
                print("Tapped throttle")
            })
            .disposed(by: disbag)
        
        debounceButton.rx.tap.asDriver()
            .debounce(.seconds(2))
            .asObservable()
            .subscribe(onNext : { [weak self] value in
                guard let self = self else {return}
                self.present(CombineLatestVC(), animated: true, completion: nil)
            })
            .disposed(by: disbag)
        
    }
    

    @IBAction func tappedThrottle(){
      
    }
    
    @IBAction func tappedDebounce(){
        
    }
}

