//
//  ContentView.swift
//  Tracker_app Watch App
//
//  Created by Hossain S M F (FCES) on 22/02/2026.
//
import SwiftUI

 

/// Main dashboard view displayed when the app launches.

/// Shows calorie total, water progress, and navigation options.

struct ContentView: View {

 

    @StateObject var vm = TrackerViewModel()

    @State var selectedPage:Int = 0

    var body: some View {

        TabView(selection:$selectedPage) {

            VStack(spacing: 12) {

 

                // Displays total calorie intake

                Text("Calories Today")

                Text("\(vm.totalCalories) kcal")

                    .font(.title)

 

                //  progress indicator

                ProgressView(value: vm.waterProgress)

                 

                Text("\(vm.log.waterLitres, specifier: "%.1f")L / \(vm.waterTarget)L")

 


            }
            VStack{
                AddEntryView(vm: vm)
            }

        }.tabViewStyle(.verticalPage)

    }

}

#Preview{
    ContentView(vm:TrackerViewModel())
}
