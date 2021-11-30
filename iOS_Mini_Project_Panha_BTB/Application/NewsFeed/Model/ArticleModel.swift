//
//  Article Model.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 29/11/21.
//

import Foundation

struct ArticleModel {
    let id: String
    let title: String
    let description: String
    let date : String
    let byAuthor: String
    
    
   let author:[String] = ["Chinda","Thary","Maya"]
    
    init(article: Article){
        self.id = article.id
        self.title = article.title
        self.description = article.description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        let newDate = dateFormatter.date(from: article.createdAt)

        let readableFormatter = DateFormatter()
        readableFormatter.dateFormat = "EEE. dd MMM yy"


        self.date = readableFormatter.string(from: newDate!)

 self.byAuthor = author[Int.random(in: 0...2)]
        
        
    }
    
}

