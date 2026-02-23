//
//  DailyLog.swift
//  Tracker_app Watch App
//
//  Created by Hossain S M F (FCES) on 22/02/2026.
//

import Foundation
//daily tracking
struct DailyLog: Codable { //cadable allows saving/loading data
    var date: Date
    var entries: [Entry]
    var waterLitres: Double = 0.0
    
    //total
    /*var totalCaloriesBurned: Double {
        entries.reduce(0) { $0 + $1.calories}
    }*/
    
}
