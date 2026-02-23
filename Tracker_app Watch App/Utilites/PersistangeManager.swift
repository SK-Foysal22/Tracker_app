//
//  PersistangeManager.swift
//  Tracker_app Watch App
//
//  Created by Hossain S M F (FCES) on 22/02/2026.
//

import Foundation

 
//manage save data & loading data
class PersistenceManager {
 private let key = "dailyLog"

 func save(log: DailyLog) {

        if let data = try? JSONEncoder().encode(log) {

            UserDefaults.standard.set(data, forKey: key)

        }

    }

 

    func load() -> DailyLog? {

        guard let data = UserDefaults.standard.data(forKey: key),

              let log = try? JSONDecoder().decode(DailyLog.self, from: data)

        else {

            return nil

        }

        return log

    }

} 
