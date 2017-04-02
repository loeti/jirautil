import Commander
import Foundation

public typealias JSON = [String : Any]

func processAttachments(dirPath path: String) -> JSON {
    
    return [:]
}

let indexAttachmentsCommand = command(
    Option("output", "attachments_index.json", flag: "o", description: "output file name"),
    Flag("prettyPrinted", flag: "p", description: "pretty printed output"),
    Argument("input", description: "input attachments directory path")
){ (outputFilePath: String, doPrettyPrint: Bool, attachementsDirectoryPath: String) in
    
    processAttachments(dirPath: attachementsDirectoryPath)

}



let main = Group { group in
    group.addCommand("index", indexAttachmentsCommand)
}

main.run()
