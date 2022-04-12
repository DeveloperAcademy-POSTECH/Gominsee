//
//  Report+CoreDataProperties.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/12.
//
//

import Foundation
import CoreData


extension Report {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Report> {
        return NSFetchRequest<Report>(entityName: "Report")
    }

    @NSManaged public var contents: Int16
    @NSManaged public var rid: Int16
    @NSManaged public var reportToAnswer: Answer?
    @NSManaged public var reportToQuestion: Question?
    @NSManaged public var reportToUser: User?

}

extension Report : Identifiable {

}
