//
//  HackerWidget.swift
//  HackerWidget
//
//  Created by Danna Lee on 2022/06/18.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct HackerWidgetEntryView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall, .systemLarge, .systemExtraLarge:
            ZStack {
                Text("Small")
                Text("Large")
            }
        case .systemMedium:
            ZStack {
                Image(uiImage: UIImage(named: "청년머리") ?? UIImage()).resizable().scaledToFit()
                AsyncImage(url: URL(string: "https://hacker-image.s3.ap-northeast-2.amazonaws.com/head/2022-06-17/user/69"))
            }
        @unknown default:
            Text("ERROR")
        }
    }
}

@main
struct NSWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        HackerWidget()
        HackerWidget2()
    }
}

struct HackerWidget: Widget {
    let kind: String = "HackerWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HackerWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct HackerWidget2: Widget {
    let kind: String = "HackerWidget2"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HackerWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget2")
        .description("This is an example widget2.")
    }
}

struct HackerWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HackerWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HackerWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HackerWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
