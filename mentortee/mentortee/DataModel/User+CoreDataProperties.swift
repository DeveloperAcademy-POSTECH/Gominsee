//
//  User+CoreDataProperties.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/12.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var uid: String?
    @NSManaged public var username: String?
    @NSManaged public var userToAnswer: NSSet?
    @NSManaged public var userToCharacter: Character?
    @NSManaged public var userToQuestion: NSSet?
    @NSManaged public var userToReport: NSSet?
    @NSManaged public var userToUserCategory: NSSet?
    
    var wrappedUserName: String {
        username ?? "Unknown"
    }

}

// MARK: Generated accessors for userToAnswer
extension User {

    @objc(addUserToAnswerObject:)
    @NSManaged public func addToUserToAnswer(_ value: Answer)

    @objc(removeUserToAnswerObject:)
    @NSManaged public func removeFromUserToAnswer(_ value: Answer)

    @objc(addUserToAnswer:)
    @NSManaged public func addToUserToAnswer(_ values: NSSet)

    @objc(removeUserToAnswer:)
    @NSManaged public func removeFromUserToAnswer(_ values: NSSet)

}

// MARK: Generated accessors for userToQuestion
extension User {

    @objc(addUserToQuestionObject:)
    @NSManaged public func addToUserToQuestion(_ value: Question)

    @objc(removeUserToQuestionObject:)
    @NSManaged public func removeFromUserToQuestion(_ value: Question)

    @objc(addUserToQuestion:)
    @NSManaged public func addToUserToQuestion(_ values: NSSet)

    @objc(removeUserToQuestion:)
    @NSManaged public func removeFromUserToQuestion(_ values: NSSet)

}

// MARK: Generated accessors for userToReport
extension User {

    @objc(addUserToReportObject:)
    @NSManaged public func addToUserToReport(_ value: Report)

    @objc(removeUserToReportObject:)
    @NSManaged public func removeFromUserToReport(_ value: Report)

    @objc(addUserToReport:)
    @NSManaged public func addToUserToReport(_ values: NSSet)

    @objc(removeUserToReport:)
    @NSManaged public func removeFromUserToReport(_ values: NSSet)

}

// MARK: Generated accessors for userToUserCategory
extension User {

    @objc(addUserToUserCategoryObject:)
    @NSManaged public func addToUserToUserCategory(_ value: UserCategory)

    @objc(removeUserToUserCategoryObject:)
    @NSManaged public func removeFromUserToUserCategory(_ value: UserCategory)

    @objc(addUserToUserCategory:)
    @NSManaged public func addToUserToUserCategory(_ values: NSSet)

    @objc(removeUserToUserCategory:)
    @NSManaged public func removeFromUserToUserCategory(_ values: NSSet)

}

extension User : Identifiable {

}
