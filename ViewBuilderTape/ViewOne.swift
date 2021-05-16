//
//  ViewOne.swift
//  ViewBuilderTape
//
//  Created by Sraavan Chevireddy on 5/16/21.
//

import SwiftUI

struct ViewOne: View {
    @State var isSquared : Bool = true
    @Namespace var animation
    
    var body: some View {
        NavigationView{
            Button(action: {
                isSquared.toggle()
            }, label: {
                squareOrCirle()
            })
            Text("Hello, World!")
                .navigationTitle("One")
        }
    }
}

struct ViewOne_Previews: PreviewProvider {
    static var previews: some View {
        ViewOne()
    }
}


// Genrally to build isolated views use SwiftUI's @ViewBuilder Property as a Extension to the main view.
extension ViewOne{
    @ViewBuilder func squareOrCirle()-> some View{
        if isSquared{
            withAnimation(.easeIn) {
                Capsule().fill(Color.green).frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,alignment: .center)
                    .matchedGeometryEffect(id: "ci", in: animation)
            }
        }else{
            withAnimation(.linear) {
                Capsule().fill(Color.pink).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,alignment: .center).matchedGeometryEffect(id: "ci", in: animation)
            }
        }
    }
}
