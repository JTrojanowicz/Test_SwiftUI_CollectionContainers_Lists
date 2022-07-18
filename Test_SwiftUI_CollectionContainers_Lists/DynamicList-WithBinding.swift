//
//  DynamicList-ElementsWithBinding.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 25/05/2022.
//

// https://peterfriese.dev/posts/swiftui-listview-part2/

import SwiftUI

struct DynamicList_WithBinding: View {
    @State private var collection = [String()]
    
    var body: some View {
        // NOTICE: the bindings of the collection of elements in the Lists were introduced in SwiftUI 3 (but it is said that you can back-deploy this code to any release of iOS that supports SwiftUI)
        List($collection, id: \.self) { $element in
            VStack(alignment: .leading) {
                Text("Element name: \(element)")
                TextField("New name", text: $element) // NOTICE: there is a problem with TextField (loses focus after writing one character --> here you have somewhat similar issue with a workaround (wrapping UIKit UITextField inside SwiftUI): https://stackoverflow.com/questions/63500276/swiftui-textfield-behaves-weirdly-when-i-bind-its-value-cant-type-chinese-occ
            }
        }
        .toolbar {
            Button("Add") {
                collection.append(String())
            }
        }
    }
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
