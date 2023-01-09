//
//  CompanyListViewController.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 13/10/22.
//

import UIKit
import CoreData

class CompanyListViewController: UIViewController {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TestModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    @IBOutlet weak var companyTableView: UITableView!
    
    @IBOutlet weak var companySearchBar: UISearchBar!
    
    private var companies: [CompanyModel] = []
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private var companyData: CompanyData?

    override func viewDidLoad() {
        super.viewDidLoad()
        companyTableView.dataSource = self
        companySearchBar.delegate = self
        
        companyData = CompanyData(
            objectManagerContext: persistentContainer.viewContext
        )
        
        /*companyData?.delete()
        
        var companies: [CompanyModel] = []
        
        for item in 0...10000 {
            companies.append(
                .init(
                    id: Int64(item),
                    name: "Empresa \(item)")
            )
        }
        
        companyData?.save(companies: companies)*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let companies = companyData?.getAllCompanies() else {
           return
        }
        self.companies = companies
        companyTableView.reloadData()
    }
}

extension CompanyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = UIListContentConfiguration.cell()
        let company = companies[indexPath.row]
        content.text = "\(company.id) " + company.name
        cell.contentConfiguration = content
        return cell
    }
}

extension CompanyListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let companies = companyData?.getAllCompanies(by: searchText) else {
           return
        }
        self.companies = companies
        companyTableView.reloadData()
    }
}
