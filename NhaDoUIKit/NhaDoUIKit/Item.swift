//
//  Item.swift
//  NhaDoUIKit
//
//  Created by Nguyễn Hoàng Văn Nhã on 7/6/22.
//

import Foundation

class Item {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
//        return NSFetchRequest<Item>(entityName: "Item")
//    }

    @NSManaged public var done: Bool
    @NSManaged public var title: String?

}
