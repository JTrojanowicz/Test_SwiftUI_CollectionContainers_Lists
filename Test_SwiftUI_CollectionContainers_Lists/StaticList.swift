//
//  StaticList.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 24/05/2022.
//

import SwiftUI

struct StaticList: View {
    var body: some View {
        List {
            Text("Swipe right")
                .badge("Badge (String)") // NOTICE: badge can take String or integer
                .swipeActions(edge: .leading) {
                    Button {
                        print("Button 1 pressed!")
                    } label: {
                        Label("House", systemImage: "house")
                    }
                    .tint(.green)
                }
            Text("Swipe left")
                .badge(2) // NOTICE: badge can take String or integer
                .swipeActions(allowsFullSwipe: false) {
                    Button("Button 2") {
                        print("Button 2 pressed!")
                    }
                    .tint(.indigo)
                    
                    Button("Delete", role: .destructive) {
                        print("Delete pressed!")
                    }
                }
            Text("Swift left or right")
                .swipeActions(edge: .leading) {
                    Button {
                        print("Button 1 pressed!")
                    } label: {
                        Label("House", systemImage: "house")
                    }
                    .tint(.yellow)
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        print("Button 2 pressed!")
                    } label: {
                        Label("House", systemImage: "house")
                    }
                    .tint(.orange)
                }
            
            Section(header: Text("Header"), footer: Text("Footer")) {
                Text("Row 1")
                Text("Row 2")
            }
            .listRowSeparator(.hidden)
            
            Section(header: Text("Icreased Prominence Header"), footer: Text("Footer")) {
                Text("Row 1")
                Text("Row 2")
            }
            .headerProminence(.increased)
        }
//        .listStyle(.automatic)
//        .listStyle(.grouped)
//        .listStyle(.insetGrouped)
//        .listStyle(.plain)
//        .listStyle(.inset) // very similar to .plain but more moved to the right
//        .listStyle(.sidebar) // noticed that when it is .sidebar then sections can be folded
    }
}

//===============================================================================
// MARK:       ******* Preview *******
//===============================================================================
struct StaticList_preview: PreviewProvider {
    static var previews: some View {
        StaticList()
    }
}
