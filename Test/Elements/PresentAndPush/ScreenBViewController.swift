//
//  ScreenBViewController.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 24/11/22.
//

import UIKit

class ScreenBViewController: UIViewController {
    
    @IBAction func didTapDismiss(_ sender: Any) {
        
        onBoarding()
    }
    
    func irContactos() {
        let vc = ScreenAViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onBoarding() {
        let vc = ScreenCViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.viewControllers.first { $0 is Self }?.removeFromParent()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
