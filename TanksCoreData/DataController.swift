//
//  DataController.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//

import Foundation
import CoreData
import UIKit

enum NetworkError: Error {
    case serverError
    case decodingError
}

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "DataModel")
    
    init() {
        ValueTransformer.setValueTransformer(ImageTransformer(), forName: NSValueTransformerName("ImageTransformer"))
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!!")
        } catch {
            print("We could not save the Data...")
        }
    }
    
    func addTank(name: String, type: String, rank: Int16, origin: String, context: NSManagedObjectContext) {
        let tank = Tank(context: context)
        let country = Country(context: context)
        tank.country = country
        tank.tankName = name
        tank.type = type
        tank.rank = rank
        country.countryName = origin
        save(context: context)
    }
    
    
    
    func editTank(tank: Tank ,name: String, type: String, rank: Int16, origin: String, context: NSManagedObjectContext) {
        let country = tank.country
        tank.tankName = name
        tank.type = type
        tank.rank = rank
        country!.countryName = origin
        
        save(context: context)
    }
    
    func deleteTank(tank: Tank, context: NSManagedObjectContext) {
        context.delete(tank)
    }
    
    func fetchImage(completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        let url = URL(string: "https://picsum.photos/200/300?id=\(UUID().uuidString)")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            guard let picture = UIImage(data: data) else {
                completion(.failure(.decodingError))
                return
            }
            completion(.success(picture))
        }.resume()
    }
}
