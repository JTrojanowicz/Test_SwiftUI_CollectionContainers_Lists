//
//  DynamicList.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 24/05/2022.
//

import SwiftUI

struct DynamicList_ForEach: View {
    @State private var users = ["Paul", "John", "Leon", "Alicja"]
    @State private var usersIdentifiable = [
        UserIdentifiable(name: "Patrick"),
        UserIdentifiable(name: "Sam"),
        UserIdentifiable(name: "Neo"),
        UserIdentifiable(name: "Eve"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                        .listRowBackground(user == "John" ? Color.green : Color.white)
                        .listRowSeparator(.hidden)
                }
                .onMove(perform: move)
                .onDelete(perform: deleteItem(indexSet:))
                
                Section(header: Text("Header"), footer: Text("Footer")) {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                            .listRowBackground(user == "John" ? Color.green : Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .onMove(perform: move)
                    .onDelete(perform: deleteItem(indexSet:))
                }
                
                ForEach(usersIdentifiable) { user in
                    Text(user.name)
                        .listRowBackground(user.name == "Sam" ? Color.green : Color.clear)
                }
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
// MARK:       ******* <#NAME#> *******
//===============================================================================
struct UserIdentifiable: Identifiable {
    let id = UUID()
    let name: String
}
//===============================================================================
// MARK:       ******* Preview *******
//===============================================================================
struct DynamicList_preview: PreviewProvider {
    static var previews: some View {
        DynamicList_ForEach()
    }
}
