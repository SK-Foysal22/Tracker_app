//
//  Widget.swift
//  Widget
//
//  Created by Hossain S M F (FCES) on 23/02/2026.
//

import WidgetKit

import SwiftUI

 

struct TrackerEntry: TimelineEntry {

    let date: Date

    let calories: Int

    let water: Double

}

 

struct Provider: TimelineProvider {

 

    func placeholder(in context: Context) -> TrackerEntry {

        TrackerEntry(date: Date(), calories: 1200, water: 1.5)

    }

 

    func getSnapshot(in context: Context, completion: @escaping (TrackerEntry) -> Void) {

        let entry = TrackerEntry(date: Date(), calories: 1500, water: 2.0)

        completion(entry)

    }

 

    func getTimeline(in context: Context, completion: @escaping (Timeline<TrackerEntry>) -> Void) {

 

        let entry = TrackerEntry(date: Date(), calories: 1800, water: 2.5)

 

        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(1800)))

        completion(timeline)

    }

}

 

struct TrackerWidgetEntryView : View {

    var entry: Provider.Entry

 

    var body: some View {

        VStack {

            Text("Calories")

                .font(.headline)

            Text("\(entry.calories)")

                .font(.title2)

 

            Text("Water")

                .font(.headline)

            Text(String(format: "%.1f L", entry.water))

        }

    }

}

 



struct TrackerWidget: Widget {

    let kind: String = "TrackerWidget"

 

    var body: some WidgetConfiguration {

        StaticConfiguration(kind: kind, provider: Provider()) { entry in

            TrackerWidgetEntryView(entry: entry).containerBackground(.fill.tertiary, for:.widget)

        }

    }

}

#Preview(as:.accessoryRectangular){
    TrackerWidget()

}timeline:{
    TrackerEntry(date: .now, calories:1000, water:1.0)
}
