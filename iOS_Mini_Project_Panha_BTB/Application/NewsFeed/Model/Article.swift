//
//  Article.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 29/11/21.
//

import Foundation
import UIKit
import SwiftyJSON

struct Article {
    let id: String
    let title: String
    let description: String
    let imageUrl: String
    let createdAt: String
    
    init(json: JSON){
        self.id = json["_id"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.imageUrl = json["image"].stringValue
        self.createdAt = json["createdAt"].stringValue
    }
    
}
