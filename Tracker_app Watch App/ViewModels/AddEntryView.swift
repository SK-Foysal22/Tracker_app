//
//  AddEntryView.swift
//  Tracker_app Watch App
//
//  Created by Hossain S M F (FCES) on 23/02/2026.
//

import SwiftUI

 

struct AddEntryView: View {

    @ObservedObject var vm: TrackerViewModel

    @State private var selectedType: EntryType = .breakfast

    @State private var caloriesText: String = ""

 
  var body: some View {

        Form {

            Picker("Type", selection: $selectedType) {

                ForEach(EntryType.allCases, id: \.self) { type in

                    Text(type.rawValue.capitalized)

                }

            }

            TextField("Calories", text: $caloriesText)
            
            Button("Save Entry") {

                if let calories = Int(caloriesText), calories > 0 {

                    vm.addEntry(type: selectedType, calories: calories, name:"", litres:0.0)

                    caloriesText = ""

                }

            }

        }

        .navigationTitle("Add Entry")

    }

}
