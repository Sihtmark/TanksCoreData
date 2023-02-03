//
//  ViewModel.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 03.02.2023.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var countries = [Country]()
    @Published var tanks = [Tank]()
    
    init() {
        getCountries()
        getTanks()
    }
    
    func getCountries() {
        let request = NSFetchRequest<Country>(entityName: "Country")
        let sort = NSSortDescriptor(keyPath: \Country.countryName, ascending: true)
        request.sortDescriptors = [sort]
        do {
            countries = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getTanks() {
        let request = NSFetchRequest<Tank>(entityName: "Tank")
        let sort = NSSortDescriptor(keyPath: \Tank.tankName, ascending: true)
        request.sortDescriptors = [sort]
        do {
            tanks = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func save() {
        countries.removeAll()
        tanks.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getCountries()
            self.getTanks()
        }
    }
    
    func addTank(name: String, type: String, rank: Int16, origin: String, context: NSManagedObjectContext) {
        let tank = Tank(context: context)
        tank.tankName = name
        tank.type = type
        tank.rank = rank
        
        for i in countries {
            if origin == i.countryName {
                tank.country = i
            } else {
                let newCountry = Country(context: context)
                newCountry.countryName = origin
                tank.country = newCountry
            }
        }
        
        save()
    }
    
    func editTank(tank: Tank ,name: String, type: String, rank: Int16, origin: String, context: NSManagedObjectContext) {
        let country = tank.country
        tank.tankName = name
        tank.type = type
        tank.rank = rank
        country!.countryName = origin
        
        save()
    }
}
