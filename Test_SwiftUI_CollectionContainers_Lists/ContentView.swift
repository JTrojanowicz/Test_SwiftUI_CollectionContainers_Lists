//
//  ContentView.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                NavigationLink("Static list") {
                    StaticList()
                        .navigationTitle("Static list")
                }
                
                NavigationLink("Dynamic list - ForEach") {
                    DynamicList_ForEach()
                        .navigationTitle("Dynamic list - ForEach")
                }
                
                NavigationLink("Dynamic list - ScrollTo") {
                    DynamicList_ScrollTo()
                        .navigationTitle("Dynamic list - ScrollTo")
                }
                
                NavigationLink("Dynamic list - Identifiable") {
                    DynamicList_Identifiable()
                        .navigationTitle("Dynamic list - Identifiable")
                }
                
                NavigationLink("Dynamic list - WithBinding") {
                    DynamicList_WithBinding()
                        .navigationTitle("Dynamic list - WithBinding")
                }
            }
            .navigationTitle("Lists")    
        }
        .navigationViewStyle(.stack) // NOTICE: I add this to silence the warnings in debug console
    }
}

//===============================================================================
// MARK:       ******* Preview *******
//===============================================================================
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
