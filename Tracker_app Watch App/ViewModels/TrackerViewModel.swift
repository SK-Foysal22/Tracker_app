//
//  TrackerModel.swift
//  Tracker_app Watch App
//
//  Created by Hossain S M F (FCES) on 22/02/2026.
//
import SwiftUI

import Combine   // REQUIRED for @Published

 

class TrackerViewModel: ObservableObject {

 

    @Published var log: DailyLog

    @Published var waterTarget: Double = 2.0

 

    private let persistence = PersistenceManager()

 

    init() {

        self.log = persistence.load() ??

        DailyLog (date: Date(), entries: [], waterLitres: 0)

        checkForNewDay()

    }

 

    func addEntry(type: EntryType, calories: Int, name:String, litres:Double) {

        let entry = Entry (

            id: UUID(),

            type: type,
            name: name,
            
            calories: calories,

            date: Date(),
            litres:litres,

        )

        log.entries.append(entry)

        persistence.save(log: log)

    }

 

    func addWater(amount: Double) {

        log.waterLitres += amount

        persistence.save(log: log)

    }

 

    var totalCalories: Int {

        log.entries.reduce(0) { $0 + $1.calories }

    }

 

    var waterProgress: Double {

        log.waterLitres / waterTarget

    }

 

    func checkForNewDay() {

        let calendar = Calendar.current

 

        if !calendar.isDate(log.date, inSameDayAs: Date()) {

            log = DailyLog(date: Date(), entries: [], waterLitres: 0)

            persistence.save(log: log)

        }

    }

}
