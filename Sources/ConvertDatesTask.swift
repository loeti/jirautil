//
//  ConvertDatesTask.swift
//  jirautil
//
//  Created by Stephan Lötscher on 04.04.17.
//
//

import Foundation

private let dateFormatter = createDateFormatter()

func convertDates(in json: inout JSON_OBJ) {
    
    for (key, value) in json {
        switch value {
        case var subJson as JSON_OBJ:
            convertDates(in: &subJson)
            json[key] = subJson
            
        case var subJson as [JSON_OBJ]:
            convertDates(inJsonArray: &subJson)
            json[key] = subJson
            
        case var array as [Any]:
            convertDates(inArray: &array)
            json[key] = array
            
        default:
            json[key] = convertDate(value: value)
        }
    }
}


private func convertDates(inJsonArray jsonArray: inout [JSON_OBJ]) {
    
    jsonArray = jsonArray.map {  (jsonObj) in
        var json = jsonObj
        convertDates(in: &json)
        return json
    }
}


private func convertDates(inArray array: inout [Any]) {
    
    array = array.map { (item) in
        return convertDate(value: item)
    }
}

private func convertDate(value: Any) -> Any {
    let targetValue = String(describing: value)
    
    if let range = targetValue.range(of: "\\d{13}", options: .regularExpression) {
        let dateAsString = targetValue.substring(with: range)
        if let dateAsDouble = Double(dateAsString) {
            let date = Date(timeIntervalSince1970: dateAsDouble/1000.0)
            let replacement = dateFormatter.string(from: date)
            return targetValue.replacingCharacters(in: range, with: replacement)
        }
    }
    return value
}


private func createDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return dateFormatter
}

