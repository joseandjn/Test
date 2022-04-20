//
//  UICardView.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 9/03/22.
//

import Foundation
import UIKit
import QuartzCore

class UICardView: UIView {
    
    var cornerRadius: CGFloat = 10.0
    
    override func draw(_ rect: CGRect) {
        print("draw UICardView")
        print(rect)
        print(frame)
        print(bounds)
        //setCorner()
        //setShadow()
    }
    
    init(){
        super.init(frame: .zero)
        setUp()
    }
    
    func setUp(){
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCorner(){
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
    func setShadow(){
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowRadius = 10.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        //layer.shadowPath = UIBezierPath(roundedRect: bounds, byRoundingCorners:  [.allCorners], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
    }
}
