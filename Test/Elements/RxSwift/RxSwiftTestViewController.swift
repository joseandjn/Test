//
//  RxSwiftTestViewController.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 14/09/22.
//

import UIKit
import RxSwift

class RxSwiftTestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLogin() {
        login()
    }
    
    func login() {
        _ = loginInteractor()
            .subscribe { response in
            print("onNext " + response)
        } onError: { error in
            print("onError")
        } onCompleted: {
            print("onCompleted")
        } onDisposed: {
            print("onDisposed")
        }
        
    }
    
    func loginInteractor() -> Observable<String>  {
        print("loginInteractor")
        return loginWithService()
            .do(onNext: { response in
                print("se ejecuto algo en el interactor " + response )
            })
    
    }
    
    func loginWithService() -> Observable<String> {
        let observable = Observable<String>.create { observable in
            
            print("loginWithService")
            observable.onNext("Hello")
            observable.onCompleted()
            
            return Disposables.create()
        }
        return observable
    }
    
    func saveUser() {
        
    }
    
}
