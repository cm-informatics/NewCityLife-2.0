//
//  PListService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 12.09.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class PListService {
    
    private static var reportsArray = [Report]()
    private static let fileName = "myReports.plist"
    
    
    static func saveReportToPlist(dictionary: Dictionary<TableViewService.Components, Any?>) {
        
        //Datei-Pfad für die PList anlegen
        let fileManager = FileManager()
        var plistPath: URL
        
        let id = dictionary[.id] as! String
        
        let location = dictionary[.location] as? (latitude: Double, longitude: Double)
        
        //Hier wird das ursprüngliche Dictionary in ein anderes Dictionary umgewandelt damit es gültig ist und in einer Datei gespeichert werden kann.
        //Probleme macht hier die "location" Property. daher wird diese umgewandelt
        
        var conformDictionary = [String : Any]()
        conformDictionary["id"] = id
        conformDictionary["category"] = dictionary[.category]!
        conformDictionary["latitude"] = location?.latitude ?? 0.0
        conformDictionary["longitude"] = location?.longitude ?? 0.0
        conformDictionary["comment"] = dictionary[.comment]!
        conformDictionary["date"] = dictionary[.date]!
        
        let reportImage = dictionary[.image] as! UIImage
        let imageData = reportImage.pngData()
        
        conformDictionary["image"] = imageData!
        
        
        //Jetz muss das image nur noch in Data umgewandelt werden weil es die PList sonst nicht einlesen kann
        
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
            plistPath = reportsPath.appendingPathComponent(fileName, isDirectory: false)
            
            if !fileManager.fileExists(atPath: plistPath.path) {
                let dictionary = NSDictionary()
                let success = dictionary.write(to: plistPath, atomically: true)
                success ? print("File created") : print("file creation failed")
            }
            
            if let completeReport = NSMutableDictionary(contentsOf: plistPath) {
                completeReport.setObject(conformDictionary, forKey: id as NSCopying)
                do {
                    try completeReport.write(to: plistPath)
                }
                catch {
                    print("Error writing to file: \(error.localizedDescription)")
                }
                //print("Complete report: \(completeReport)")
            }
            
        }
    }
    
    static func loadReports() -> (keys: [Any], payload: NSDictionary) { //hier sollte ich ein Report-Object zurückliefern
        let fileManager = FileManager()
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let reportsPath = URL(fileURLWithPath: documentPath!, isDirectory: true).appendingPathComponent("Reports")
        let pListPath = reportsPath.appendingPathComponent(fileName, isDirectory: false)
        
        if fileManager.fileExists(atPath: pListPath.path) {
            if let listOfAllReports = NSDictionary(contentsOf: pListPath) {
                
                /*
                 users.sort {
                     $0.firstName < $1.firstName
                 }
                 */
                
                //let keys = listOfAllReports.allKeys
                
                /*keys.sorted { (one, two) -> Bool in
                    let test1 = one as! String
                    let test2 = two as! String
                    return test1 < test2
                }
 */
                
                /*var sortedArray = [Any]()
                
                for item in listOfAllReports.allValues {
                    print("Item is: \(item)")
                    let dict: NSDictionary = item as! NSDictionary
                    print("Date: \(dict.object(forKey: "date") ?? "nix")")
                    
                    sortedArray = listOfAllReports.allValues
                    
                    sortedArray.sort { (v1, v2) -> Bool in
                        
                        let datum1 = (v1 as! NSDictionary).object(forKey: "Date")
                        let datum2 = (v2 as! NSDictionary).object(forKey: "Date")
                        
                        return (datum1 as! String) < (datum2 as! String)
                    }
                    
                }
                
                */
                /*listOfAllReports.allKeys.sort{
                    $0.id < $1.id
                }
                */
                //let reportsData = (keys: listOfAllReports.allKeys, payload: listOfAllReports)
                let reportsData = (keys: listOfAllReports.allKeys, payload: listOfAllReports)
                return reportsData
            }
            
        }
        return (keys: [""], payload: NSDictionary())
    }
    
    private static func convertDictToReportObject(dataDict: [[String: Any]]) -> [Report] {
        let report = Report();
        
        for item in dataDict {
            for key in item.keys {
                switch key {
                case "longitude":
                    report.locationData.longitude = item["longitude"] as! Double
                case "date":
                    report.timestamp = item["date"] as? Date
                case "category":
                    report.category = item["category"] as? String
                case "comment":
                    report.comment = item["comment"] as? String
                case "latitude":
                    report.locationData.latitude = item["latitude"] as! Double
                case "image":
                    let imageData = item["image"] as? Data
                    //print(imageData!)
                    report.image = UIImage(data: imageData ?? Data())
                default: break
                    //print("No data available for key \(key)")
                }
            }
            reportsArray.append(report)
        }
        return reportsArray
    }
}
