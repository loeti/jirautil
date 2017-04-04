import Commander
import Foundation
import Jay


public typealias JSON_OBJ = [String : Any]

func processJsonFile(inputFilePath: String, doPrettyPrint: Bool, action:(inout JSON_OBJ) -> ()) {
    
    guard let fileContent = try? Data.init(contentsOf: URL.init(fileURLWithPath: inputFilePath)) else {
        preconditionFailure("Invalid input file: \(inputFilePath)")
    }
    
    guard let anyJson = try? Jay().anyJsonFromData(Array(fileContent)), var json = anyJson as? JSON_OBJ else {
        preconditionFailure("Invalid file content, must be valid json.")
    }
    
    action(&json)
    
    let formattingOption:Jay.Formatting = doPrettyPrint ? .prettified : .minified
    
    do {
        try Jay(formatting: formattingOption).dataFromJson(any: json, output: ConsoleOutputStream())
    }
    catch let error {
        preconditionFailure("Failed to write output " + error.localizedDescription)
    }
}

func processAttachments(dirPath path: String) -> JSON_OBJ {
    
    return [:]
}




let main = Group { group in
//    group.addCommand("index", indexAttachmentsCommand)
    group.addCommand("dates", "Converts all date values in Jira's json export file to a simple date format importable by Jira again. The converted json file is printed to the console output. Milliseconds since epoch -> yyyy-MM-dd'T'HH:mm:ss.SSSZ e.g. 1472658552478 -> 2016-08-31T17:49:12.478+0200", convertDatesCommand)
}

main.run()
