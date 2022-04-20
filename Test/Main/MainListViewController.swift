//
//  ViewController.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 16/02/22.
//

import UIKit

class MainListViewController: UIViewController {
    
    var items: [(title: String, useStoryboard: Bool)] = [
        ("Login Simple UITest", true),
        ("Card View Customizadas", false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Name viewcontroller \(self.description)")
        
    }
}

extension MainListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = UIListContentConfiguration.cell()
        content.text = items[indexPath.row].title
        cell.contentConfiguration = content
        return cell
    }
}

extension MainListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let useStoryboard = items[indexPath.row].useStoryboard
        if useStoryboard {
            gotoViewController(from : LoginViewController.self)
        } else {
            gotoViewController(to: ExampleCardViewController.self)
        }
    }
    
    func gotoViewController(from viewController: UIViewController.Type){
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: viewController.description()) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func gotoViewController(to viewController: UIViewController.Type){
        let vc = viewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
