//
//  Date+Extensions.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 18.08.23.
//

import Foundation
import UIKit

extension DateFormatter {
    static func formatCutomDate(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            return "\(year)"
        }
        return ""
    }
    
}
