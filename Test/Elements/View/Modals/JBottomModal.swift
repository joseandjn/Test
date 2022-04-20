//
//  JBottomModal.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 22/03/22.
//

import UIKit

public protocol JBottomModalBuilder {
    func addItem(view: UIView) -> AKBottomBuilder
    func build() -> UIView
}

open class JBottomModal: UIView, AKBottomBuilder {
    
    /*var viewParent: UIView!
    
    init(from viewParent: UIView) {
        self.viewParent.
    }*/
    
    lazy var backgroundView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var modalView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        return stackView
    }()
    
    func setUpModalView(){
        
        self.addSubview(modalView)
        NSLayoutConstraint.activate([
            self.modalView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.modalView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.modalView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        modalView.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.modalView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.modalView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.modalView.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.modalView.bottomAnchor)
        ])
    }
    
    private func setUpBackgroundView(){
        self.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    public func build() -> UIView {
        self.setUpModalView()
        self.setUpBackgroundView()
        return self
    }
    
    
    
    public func addItem(view: UIView) -> JBottomModal {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(view)
     
        return self
    }
    
}

