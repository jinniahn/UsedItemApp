//
//  UsedItem.swift
//  NavigationTest
//
//  Created by MF839-032 on 25/04/2018.
//  Copyright © 2018 MF839-032. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ItemStatus: String {
    case Unknown = "unknown"
    case Posted = "posted"
    case Canceled = "canceled"
    case Finished = "finished"
    case InProgress = "inprogress"
}

class UsedItem {
    var id: Int?
    var title: String?
    var userId: Int?
    var createdAt: Date?
    var price: Double?
    var status: ItemStatus = .Unknown
}

class User {
    var id: Int?
    var name: String?
    var email: String?
}

func createItemSample() -> [UsedItem] {
    let item = UsedItem()
    item.id = 1
    item.title = "아이패드 팔아요"
    item.userId = 1
    item.createdAt = Date()
    item.price = 100
    item.status = .Posted
    let item2 = UsedItem()
    item2.id = 2
    item2.title = "맥북 팔아요"
    item2.userId = 1
    item2.createdAt = Date()
    item2.price = 1000
    item2.status = .Posted
    return [item, item2]
}

func createUserSample() -> [Int:User] {
    let user = User()
    user.id = 1
    user.name = "Bongkyung"
    user.email = "bongkyung.ko@sap.com"
    return [user.id!:user]
}

let kServer = "http://192.168.0.29:3000"

func loadItems(callback: @escaping ([UsedItem]) -> Void) {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
    
    Alamofire.request(kServer + "/items").responseJSON { response in

        var ret = [UsedItem]()
        if let obj = response.result.value {
            let json = JSON(obj)
            for (_,subJson):(String, JSON) in json {
                let item = UsedItem()
                
                item.id = subJson["id"].int
                item.title = subJson["title"].string
                item.userId = subJson["userId"].int
                
                let createdAt = dateFormatter.date(from: subJson["create_at"].stringValue)
                
                item.createdAt = createdAt
                item.price  = subJson["price"].doubleValue
                
                item.status = ItemStatus(rawValue: subJson["status"].stringValue)!

                print("\(item.title!)")
                
                ret.append(item)
                
            }
        }
        
        callback(ret)
        
    }

}
