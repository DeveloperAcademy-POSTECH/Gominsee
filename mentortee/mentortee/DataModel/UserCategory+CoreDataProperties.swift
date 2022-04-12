//
//  UserCategory+CoreDataProperties.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/12.
//
//

import Foundation
import CoreData


extension UserCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCategory> {
        return NSFetchRequest<UserCategory>(entityName: "UserCategory")
    }

    @NSManaged public var ucid: Int16
    @NSManaged public var userCategoryToUser: User?
    @NSManaged public var userCategoryToCategory: Category?

}

extension UserCategory : Identifiable {

}
