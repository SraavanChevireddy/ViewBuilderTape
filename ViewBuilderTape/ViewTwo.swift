//
//  ViewTwo.swift
//  ViewBuilderTape
//
//  Created by Sraavan Chevireddy on 5/16/21.
//

import SwiftUI

struct ViewTwo: View {
    var body: some View {
        NavigationView{
            GenericContainer {
                Text("Hello")
                Text("World")
                Text("This is a Generic Container view")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("You can also add buttons to this..")
                })
            }
            .navigationTitle("View Two")
        }
    }
}

struct ViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ViewTwo()
    }
}


struct GenericContainer<Content: View> : View{
    
    let content : Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View{
        VStack{
            content.padding(5)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
        .shadow(radius: 5)
    }
}
