//
//  SQLiteService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 12.09.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import Foundation
import SQLite3

class SQLIteService {
    
    var db: OpaquePointer?
    let filename = "myReports.sqlite"
    
    func saveReport(report: Report) {
        do {
            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(filename)
            if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
                print("Error opening DB")
                return
            }
            
        }
        catch {
            print(error)
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Reports (id TEXT PRIMARY KEY, category TEXT, comment TEXT, ^"
        
    }
    
}
