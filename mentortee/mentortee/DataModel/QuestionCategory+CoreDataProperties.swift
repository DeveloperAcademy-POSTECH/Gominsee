//
//  QuestionCategory+CoreDataProperties.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/12.
//
//

import Foundation
import CoreData


extension QuestionCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionCategory> {
        return NSFetchRequest<QuestionCategory>(entityName: "QuestionCategory")
    }

    @NSManaged public var qcid: Int16
    @NSManaged public var questionCategoryToCategory: NSSet?
    @NSManaged public var questionCategoryToQuestion: Question?

}

// MARK: Generated accessors for questionCategoryToCategory
extension QuestionCategory {

    @objc(addQuestionCategoryToCategoryObject:)
    @NSManaged public func addToQuestionCategoryToCategory(_ value: Category)

    @objc(removeQuestionCategoryToCategoryObject:)
    @NSManaged public func removeFromQuestionCategoryToCategory(_ value: Category)

    @objc(addQuestionCategoryToCategory:)
    @NSManaged public func addToQuestionCategoryToCategory(_ values: NSSet)

    @objc(removeQuestionCategoryToCategory:)
    @NSManaged public func removeFromQuestionCategoryToCategory(_ values: NSSet)

}

extension QuestionCategory : Identifiable {

}
