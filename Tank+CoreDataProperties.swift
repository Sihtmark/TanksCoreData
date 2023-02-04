//
//  Tank+CoreDataProperties.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//
//

import Foundation
import CoreData
import UIKit

extension Tank {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tank> {
        return NSFetchRequest<Tank>(entityName: "Tank")
    }

    @NSManaged public var tankName: String?
    @NSManaged public var rank: Int16
    @NSManaged public var type: String?
    @NSManaged public var country: Country?
    @NSManaged public var content: UIImage?

    public var wrappedTankName: String {
        tankName ?? "Unknown tank"
    }
    public var wrappedType: String {
        type ?? "Unknown type"
    }
}

extension Tank: Identifiable {
    
}
