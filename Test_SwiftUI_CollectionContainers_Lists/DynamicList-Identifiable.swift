//
//  DynamicList-Identifiable.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 24/05/2022.
//

import SwiftUI

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-list-of-dynamic-items

//===============================================================================
// MARK:       ******* DynamicList_identifiable *******
//===============================================================================
struct DynamicList_Identifiable: View {
    let restaurants = [
        Restaurant(name: "Name 1"),
        Restaurant(name: "Name 2"),
        Restaurant(name: "Name 3"),
    ]
    
    var body: some View {
        VStack {
            List(restaurants) { restaurant in // NOTICE: only arrays of Identifiable elements can be accepted in Lists this way
                Text("Restaurant: \(restaurant.name)")
            }
            
            // Using ForEach puts the view one above the other but this is not a list (eg. it doesn't have rows, styles, etc)
            ForEach(restaurants) { restaurant in
                Text(restaurant.name)
            }
        }
    }
}

//===============================================================================
// MARK:       ******* Model *******
//===============================================================================
struct Restaurant: Identifiable {
    let id = UUID() // NOTICE: you need to have this constant (or similar) to conform to Identifiable protocol
    let name: String
}

//===============================================================================
// MARK:       ******* Preview *******
//===============================================================================
struct DynamicList_identifiable_preview: PreviewProvider {
    static var previews: some View {
        DynamicList_Identifiable()
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}


