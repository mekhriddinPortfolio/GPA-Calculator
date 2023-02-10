//
//  Subject+CoreDataProperties.swift
//  
//
//  Created by Mekhriddin Jumaev on 07/02/23.
//
//

import Foundation
import CoreData


extension Subject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subject> {
        return NSFetchRequest<Subject>(entityName: "Subject")
    }

    @NSManaged public var name: String?
    @NSManaged public var grade: String?
    @NSManaged public var credits: Int16
    @NSManaged public var semester: Semester?

}
