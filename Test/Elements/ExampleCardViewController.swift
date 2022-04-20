//
//  ExampleCardViewController.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 9/03/22.
//

import UIKit

class ExampleCardViewController: UIViewController {

    
    lazy var cardView: UICardView = {
        var view = UICardView()
        view.cornerRadius = 10.0
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setupView()
        setupCardView()
    }
    func setupView(){
        self.view.backgroundColor = .white
    }
    
    func setupCardView(){
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            cardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            self.view.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 20.0),
            cardView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        cardView.setCorner()
        cardView.setShadow()
        
    }
}
