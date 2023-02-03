//
//  DataController.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer = NSPersistentContainer(name: "DataModel")
    let context: NSManagedObjectContext
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data: \(error.localizedDescription)")
                return
            }
//            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving core data: \(error.localizedDescription)")
        }
    }
}
