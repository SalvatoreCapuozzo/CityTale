//
//  User+CoreDataProperties.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 13/09/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?

}

extension User : Identifiable {

}
