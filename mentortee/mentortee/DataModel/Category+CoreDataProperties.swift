//
//  Category+CoreDataProperties.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/12.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var cid: Int16
    @NSManaged public var contents: String?
    @NSManaged public var categoryToQuestionCategory: QuestionCategory?
    @NSManaged public var categoryToUserCategory: NSSet?

}

// MARK: Generated accessors for categoryToUserCategory
extension Category {

    @objc(addCategoryToUserCategoryObject:)
    @NSManaged public func addToCategoryToUserCategory(_ value: UserCategory)

    @objc(removeCategoryToUserCategoryObject:)
    @NSManaged public func removeFromCategoryToUserCategory(_ value: UserCategory)

    @objc(addCategoryToUserCategory:)
    @NSManaged public func addToCategoryToUserCategory(_ values: NSSet)

    @objc(removeCategoryToUserCategory:)
    @NSManaged public func removeFromCategoryToUserCategory(_ values: NSSet)

}

extension Category : Identifiable {

}
