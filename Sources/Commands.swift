//
//  Commands.swift
//  jirautil
//
//  Created by Stephan Lötscher on 04.04.17.
//
//

import Foundation

import Commander

//replace command
let convertDatesCommand = command(
    Flag("prettyPrinted", flag: "p", description: "pretty printed output"),
    Argument("input", description: "path to json input file. ")
) {
    (doPrettyPrint: Bool, filePath: String) in
    
    processJsonFile(inputFilePath: filePath, doPrettyPrint: doPrettyPrint) { (json) in
        convertDates(in: &json)
    }
}


let indexAttachmentsCommand = command(
    Flag("prettyPrinted", flag: "p", description: "pretty printed output"),
    Argument("input", description: "input attachments directory path")
){ (doPrettyPrint: Bool, attachementsDirectoryPath: String) in
    
    //processAttachments(dirPath: attachementsDirectoryPath)
    
}

