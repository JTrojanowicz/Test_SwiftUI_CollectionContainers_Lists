//
//  DynamicList.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 24/05/2022.
//

import SwiftUI

struct DynamicList_ForEach: View {
    @State private var users = ["Paul", "John", "Leon"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                        .listRowBackground(user == "John" ? Color.green : Color.clear)
                        .listRowSeparator(.hidden)
                }
                .onMove(perform: move)
                .onDelete(perform: deleteItem(indexSet:))
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
    
    func deleteItem(indexSet: IndexSet) {
        for index in indexSet {
            users.remove(at: index)
        }
    }
}

//===============================================================================
// MARK:       ******* Preview *******
//===============================================================================
struct DynamicList_preview: PreviewProvider {
    static var previews: some View {
        DynamicList_ForEach()
    }
}
