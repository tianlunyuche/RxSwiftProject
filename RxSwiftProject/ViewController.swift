//
//  ViewController.swift
//  EKParent
//
//  Created by 赵庄鑫 on 2018/4/12.
//  Copyright © 2018 赵庄鑫. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

typealias JSON = Any

struct UserViewModel {
    //
    let userName = BehaviorRelay(value: "guest")
    lazy var userInfo = {
        return self.userName.asObservable().map{ $0 == "hangge" ? "管理员" : "访客"}
            .share(replay: 1)
    }()
}

class ViewController: UIViewController {
    
    lazy var textField: UITextField = {
        let textField = UITextField.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50));
        return textField;
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 200, width: 300, height: 100));
        label.text = "好的e"
        return label
    }()
    
    var userVM = UserViewModel()
    
    let json: Observable<JSON> = Observable.create { (observer) -> Disposable in
        
        let request = URLRequest(url: URL(string: "")!)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard error == nil else {
                observer.onError(error!)
                return
            }
            
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                else {
                    observer.onError("" as! Error)
                    return
            }
            
            observer.onNext(jsonObject)
            observer.onCompleted()
        }
        
        task.resume()
        
        return Disposables.create { task.cancel() }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let observable = Observable.of("A", "B", "C")
        observable
            .do(onNext: { (element) in
                print("Intercepted Next：", element)
            }, onError: { (error) in
                print(error)
            }, onCompleted: {
                
            }, onSubscribe: {
                
            }, onSubscribed: {
                
            }) {
                
        }
        
        let disposeBag = DisposeBag()
        //        userVM.userName.asObservable().bind(to: textField.rx.text).disposed(by: disposeBag)
        //        textField.rx.text.orEmpty.bind(to: userVM.userName).disposed(by: disposeBag)
        //<=>
        //View层和 订阅者双向绑定
        _ = self.textField.rx.textInput <-> self.userVM.userName
        //事件处理的结果 绑定到 View层
        userVM.userInfo.bind(to: label.rx.text).disposed(by: disposeBag)
        //        _ = self.textField.rx.textInput
        //        self.setup()
        
        let numbers: Observable<Int> = Observable.create { (observer) -> Disposable in
            observer.onNext(0)
            observer.onNext(1)
            
            return Disposables.create()
        }
        print(numbers)
        
        json.subscribe(onNext: { (json) in
            print("成功: \(json)")
        }, onError: { (error) in
            print("失败：\(error.localizedDescription)")
        }, onCompleted: {
            print("fa")
        }) .disposed(by: disposeBag)
    }
    
    func setup() {
        let titleArray = [EKAsset.Add_friend_icon.image]
        print(titleArray)
    }
    
}

