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
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
    }
}

