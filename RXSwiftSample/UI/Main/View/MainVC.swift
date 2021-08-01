//
//  ViewController.swift
//  samplerxswift
//
//  Created by phong070 on 05/07/2021.
//

import UIKit
import RxSwift
class MainVC : BaseViewController {
    var viewModel : MainViewModel!
    let cell = "cell"
    lazy var throttleButton : UIButton = {
        let view = UIButton()
        view.setTitle("Throttle", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    lazy var debounceButton : UIButton = {
        let view = UIButton()
        view.setTitle("Debounce", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    lazy var tableView : UITableView = {
        let view = UITableView()
        return view
    }()
    
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initUI()
        viewModel = MainViewModel()
        bindingEvent()
        throttleButton.addTarget(self, action: #selector(tappedThrottle), for: .touchUpInside)
        debounceButton.addTarget(self, action: #selector(tappedDebounce), for: .touchUpInside)
        
        throttleButton.rx.tap.asDriver()
            .throttle(.seconds(2))
            .asObservable()
            .subscribe(onNext  :{ [weak self ] value in
                guard let self = self else {return}
                self.log(any: "Tapped throttle")
            })
            .disposed(by: disbag)
        
        debounceButton.rx.tap.asDriver()
            .debounce(.seconds(2))
            .asObservable()
            .subscribe(onNext : { [weak self] value in
                guard let self = self else {return}
            })
            .disposed(by: disbag)
        
    }
    
    private func bindingEvent(){
        viewModel.onData.subscribe(onNext : { [weak self] data in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.data.removeAll()
                self.data.append(contentsOf: data)
                self.tableView.reloadData()
            }
        })
        .disposed(by: disbag)
        viewModel.getData()
    }
    
    @objc func tappedThrottle(){
      
    }
    
    @objc func tappedDebounce(){
        
    }
    
    lazy var data : [Main] = {
       return [Main]()
    }()
}

extension MainVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
}

extension MainVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigation(id: indexPath.row)
    }
    
    func navigation(id : Int){
        switch id {
        case 0:
            self.present(CombineLatestVC(), animated: true, completion: nil)
        case 1:
            self.present(FlatMapFlatMapLatestVC(), animated: true, completion: nil)
        default:
            log(any: "Nothing")
        }
    }
    
}
