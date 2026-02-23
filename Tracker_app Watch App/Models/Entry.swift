//
//  Entry.swift
//  Tracker_app Watch App
//
//  Created by Hossain S M F (FCES) on 22/02/2026.
//
import Foundation

 
//entry type
enum EntryType: String, Codable, CaseIterable {

    case breakfast
    case lunch
    case dinner
    case snack
    case drink

}

 
//single meal represent
struct Entry: Identifiable, Codable {
    
   /*
    var id: UUID {
        var type :EntryType
        var name :String
        
        var _: Int
        var litres: Double?
    }
*/
    let id: UUID
    let type: EntryType
    let name: String
    let calories: Int
    let date: Date
    let litres: Double?

}
