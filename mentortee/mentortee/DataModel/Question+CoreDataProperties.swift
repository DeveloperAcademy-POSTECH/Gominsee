////
////  Question+CoreDataProperties.swift
////  mentortee
////
////  Created by 김민택 on 2022/04/12.
////
////
//
//import Foundation
//import CoreData
//
//
//extension Question {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
//        return NSFetchRequest<Question>(entityName: "Question")
//    }
//
//    @NSManaged public var contents: String?
//    @NSManaged public var date: Date?
//    @NSManaged public var secret: Bool
//    @NSManaged public var qid: Int16
//    @NSManaged public var questionToAnswer: NSSet?
//    @NSManaged public var questionToQuestionCategory: NSSet?
//    @NSManaged public var questionToReport: NSSet?
//    @NSManaged public var questionToUser: User?
//
//}
//
//// MARK: Generated accessors for questionToAnswer
//extension Question {
//
//    @objc(addQuestionToAnswerObject:)
//    @NSManaged public func addToQuestionToAnswer(_ value: Answer)
//
//    @objc(removeQuestionToAnswerObject:)
//    @NSManaged public func removeFromQuestionToAnswer(_ value: Answer)
//
//    @objc(addQuestionToAnswer:)
//    @NSManaged public func addToQuestionToAnswer(_ values: NSSet)
//
//    @objc(removeQuestionToAnswer:)
//    @NSManaged public func removeFromQuestionToAnswer(_ values: NSSet)
//
//}
//
//// MARK: Generated accessors for questionToQuestionCategory
//extension Question {
//
//    @objc(addQuestionToQuestionCategoryObject:)
//    @NSManaged public func addToQuestionToQuestionCategory(_ value: QuestionCategory)
//
//    @objc(removeQuestionToQuestionCategoryObject:)
//    @NSManaged public func removeFromQuestionToQuestionCategory(_ value: QuestionCategory)
//
//    @objc(addQuestionToQuestionCategory:)
//    @NSManaged public func addToQuestionToQuestionCategory(_ values: NSSet)
//
//    @objc(removeQuestionToQuestionCategory:)
//    @NSManaged public func removeFromQuestionToQuestionCategory(_ values: NSSet)
//
//}
//
//// MARK: Generated accessors for questionToReport
//extension Question {
//
//    @objc(addQuestionToReportObject:)
//    @NSManaged public func addToQuestionToReport(_ value: Report)
//
//    @objc(removeQuestionToReportObject:)
//    @NSManaged public func removeFromQuestionToReport(_ value: Report)
//
//    @objc(addQuestionToReport:)
//    @NSManaged public func addToQuestionToReport(_ values: NSSet)
//
//    @objc(removeQuestionToReport:)
//    @NSManaged public func removeFromQuestionToReport(_ values: NSSet)
//
//}
//
//extension Question : Identifiable {
//
//}
