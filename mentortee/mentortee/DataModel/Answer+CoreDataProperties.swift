//
//  Answer+CoreDataProperties.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/12.
//
//

import Foundation
import CoreData


extension Answer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answer> {
        return NSFetchRequest<Answer>(entityName: "Answer")
    }

    @NSManaged public var aid: Int16
    @NSManaged public var contents: String?
    @NSManaged public var date: Date?
    @NSManaged public var secret: Bool
    @NSManaged public var answerToQuestion: Question?
    @NSManaged public var answerToReport: NSSet?
    @NSManaged public var answerToUser: User?

}

// MARK: Generated accessors for answerToReport
extension Answer {

    @objc(addAnswerToReportObject:)
    @NSManaged public func addToAnswerToReport(_ value: Report)

    @objc(removeAnswerToReportObject:)
    @NSManaged public func removeFromAnswerToReport(_ value: Report)

    @objc(addAnswerToReport:)
    @NSManaged public func addToAnswerToReport(_ values: NSSet)

    @objc(removeAnswerToReport:)
    @NSManaged public func removeFromAnswerToReport(_ values: NSSet)

}

extension Answer : Identifiable {

}
