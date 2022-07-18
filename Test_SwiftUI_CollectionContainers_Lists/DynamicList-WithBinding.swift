//
//  DynamicList-ElementsWithBinding.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 25/05/2022.
//

// https://peterfriese.dev/posts/swiftui-listview-part2/

import SwiftUI

struct DynamicList_WithBinding: View {
    @State private var elementsIdentifiable = [Element()] // NOTICE: Lists with binding can work with Identifiable arrays but I've noticed that there is some problem with non-identifiable arrays (eg. TextField was loosing focus after writing the first letter)
    
    var body: some View {
        // NOTICE: the bindings of the collection of elements in the Lists were introduced in SwiftUI 3 (but it is said that you can back-deploy this code to any release of iOS that supports SwiftUI)
        List($elementsIdentifiable) { $element in
            VStack(alignment: .leading) {
                Text("Element text: \(element.text)")
                TextField("New text", text: $element.text)
            }
        }
        .toolbar {
            Button("Add") {
                elementsIdentifiable.append(Element())
            }
        }
    }
}

//===============================================================================
// MARK:       ******* ElementIdentifiable *******
//===============================================================================
struct Element: Identifiable {
    let id = UUID()
    var text = String()
}

//===============================================================================
// MARK:       ******* Preview *******
//===============================================================================
struct DynamicList_ElementsWithBinding_preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DynamicList_WithBinding()
        }
    }
}
