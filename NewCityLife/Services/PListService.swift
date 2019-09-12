//
//  PListService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 12.09.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class PListService {
    static func saveReportToPlist(report: Report) {
        
        //Datei-Pfad für die PList anlegen
        let fileManager = FileManager()
        var plistPath: URL
        
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        if let documentDir = rootPath {
            let reportsPath = URL(fileURLWithPath: documentDir, isDirectory: true).appendingPathComponent("Reports")
            
            if !fileManager.fileExists(atPath: reportsPath.path){
                do {
                    try fileManager.createDirectory(at: reportsPath, withIntermediateDirectories: false, attributes: nil)
                    print("Verzeichnis wurde erfolgreich erstellt. Path: \(reportsPath)")
                }
                catch {
                    print("Fehler bei Erstellung: \(error)")
                }
            }
            //Da das Verzeichnis existiert wird jetzt die pList erstellt
            plistPath = reportsPath.appendingPathComponent("myReports.plist", isDirectory: false)
            
            if !fileManager.fileExists(atPath: plistPath.path) {
                let dictionary = NSDictionary()
                let success = dictionary.write(to: plistPath, atomically: true)
                success ? print("File created") : print("file creation failed")
            }
            
            if let completeReport = NSMutableDictionary(contentsOf: plistPath) {
                completeReport.setObject(report, forKey: report.id! as NSCopying)
                do {
                    try completeReport.write(to: plistPath)
                }
                catch {
                    print("Error writing to file: \(error)")
                }
                print("Complete report: \(completeReport)")
            }
            
        }
    }
}
