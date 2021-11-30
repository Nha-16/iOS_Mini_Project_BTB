//
//  String.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 30/11/21.
//

import Foundation
extension String{
    func ReadableDate()->String{
        let dateFormmat = DateFormatter()
        dateFormmat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormmat.date(from: self)
    
        
        return "\(date!.getStringFromDateFormat(format: "EEE")). \(date!.getStringFromDateFormat(format: "hh:mm aa"))"
    }
}
