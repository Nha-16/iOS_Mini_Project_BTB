//
//  Date + String.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 30/11/21.
//

import Foundation
extension Date {
    func getStringFromDateFormat(format: String)->String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
