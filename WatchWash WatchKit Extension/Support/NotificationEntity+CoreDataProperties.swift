//
//  NotificationEntity+CoreDataProperties.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/26/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//
//

import Foundation
import CoreData


extension NotificationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotificationEntity> {
        return NSFetchRequest<NotificationEntity>(entityName: "NotificationEntity")
    }

    @NSManaged public var hour: Int64
    @NSManaged public var minute: Int64
    @NSManaged public var tod: String?

}
