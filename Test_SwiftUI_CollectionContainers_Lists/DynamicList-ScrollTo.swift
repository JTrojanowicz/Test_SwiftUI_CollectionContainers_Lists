//
//  DynamicList-scrollTo.swift
//  TestSwiftUI-Lists
//
//  Created by Jaroslaw Trojanowicz on 24/05/2022.
//

import SwiftUI

struct DynamicList_ScrollTo: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Jump to #50") {
                    withAnimation {
                        proxy.scrollTo(50, anchor: .top)
                    }
                }
                .padding()
                
                List(0..<100, id: \.self) { i in
                    Text("Example \(i)")
                        .id(i)
                }
            }
        }
    }
}

//===============================================================================
// MARK:       ******* Preview *******
//===============================================================================
struct DynListScrollTo_preview: PreviewProvider {
    static var previews: some View {
        DynamicList_ScrollTo()
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
