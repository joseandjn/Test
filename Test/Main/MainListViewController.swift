//
//  ViewController.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 16/02/22.
//

import UIKit

class MainListViewController: UIViewController {
    
    struct Controller {
        let title: String
        let useStoryboard: Bool
        var viewController: UIViewController.Type?
    }
    
    var items: [Controller] = [
        .init(
            title: "Login Simple UITest",
            useStoryboard: true
        ),
        .init(
            title: "Card View Customizadas",
            useStoryboard: false,
            viewController: ExampleCardViewController.self
        ),
        .init(
            title: "Test RxSwift",
            useStoryboard: false,
            viewController: RxSwiftTestViewController.self
        ),
        .init(
            title: "Example Core Data",
            useStoryboard: false,
            viewController: CompanyListViewController.self
        ),
        .init(
            title: "Present Push",
            useStoryboard: false,
            viewController: ScreenBViewController.self
        ),
        .init(
            title: "Lista",
            useStoryboard: false,
            viewController: ListaTableViewController.self
        )
    ]
    
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
        
        let item = items[indexPath.row]
        if item.useStoryboard {
            gotoViewController(from : LoginViewController.self)
        } else {
            guard let viewController = item.viewController else { return }
            gotoViewController(to: viewController)
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
