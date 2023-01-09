//
//  CompanyData.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 12/10/22.
//

import Foundation
import CoreData

class CompanyData {
    
    let objectManagerContext: NSManagedObjectContext
    
    init(objectManagerContext: NSManagedObjectContext) {
        self.objectManagerContext = objectManagerContext
    }
    
    func getAllCompanies(by name: String = "") -> [CompanyModel] {
        
        var companies: [CompanyModel] = []
        
        do {
            let predicate = NSPredicate(format: "name BEGINSWITH %@", name)
            
            let request = NSFetchRequest<Company>(entityName: "Company")
            request.predicate = predicate
            
            let result = try objectManagerContext.fetch(request)
            
            result.forEach { company in
                companies.append(.init(
                    id: company.id,
                    name: company.name ?? "")
                )
            }
            
        } catch let error {
            print(error)
        }
        return companies
    }
    
    func getAllCompanies() -> [CompanyModel] {
        
        var companies: [CompanyModel] = []
        
        do {
            let request = NSFetchRequest<Company>(entityName: "Company")
            let result = try objectManagerContext.fetch(request)
            
            result.forEach { company in
                companies.append(.init(
                    id: company.id,
                    name: company.name ?? "")
                )
            }
            
        } catch let error {
            print(error)
        }
        return companies
    }
    
    @discardableResult
    func save(companies: [CompanyModel]) {
        
        companies.forEach { company in
            save(company: company)
        }
    }
    
    @discardableResult
    func save(company: CompanyModel) -> Bool {
        
        let objectManager = NSEntityDescription.insertNewObject(
            forEntityName: "Company",
            into: objectManagerContext) as! Company
        
        objectManager.id = company.id
        objectManager.name = company.name
        
        do {
            try objectManagerContext.save()
            return true
        } catch let error {
            print(error)
            return false
        }
    }
    
    func delete() {
        
        do {
            let request = NSFetchRequest<Company>(entityName: "Company")
            let result = try objectManagerContext.fetch(request)
            
            result.forEach { company in
                objectManagerContext.delete(company)
            }
            
            try objectManagerContext.save()
        } catch let error {
            print(error)
        }
    }
}
