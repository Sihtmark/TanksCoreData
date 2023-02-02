//
//  Country+CoreDataProperties.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var countryName: String?
    @NSManaged public var tanks: NSSet?

}

// MARK: Generated accessors for tanks
extension Country {

    @objc(addTanksObject:)
    @NSManaged public func addToTanks(_ value: Tank)

    @objc(removeTanksObject:)
    @NSManaged public func removeFromTanks(_ value: Tank)

    @objc(addTanks:)
    @NSManaged public func addToTanks(_ values: NSSet)

    @objc(removeTanks:)
    @NSManaged public func removeFromTanks(_ values: NSSet)

    public var wrappedCountry: String {
        countryName ?? "Unknown country"
    }
    public var tankArray: [Tank] {
        let set = tanks as? Set<Tank> ?? []
        return set.sorted {
            $0.wrappedTankName < $1.wrappedTankName
        }
    }
}

extension Country : Identifiable {

}
