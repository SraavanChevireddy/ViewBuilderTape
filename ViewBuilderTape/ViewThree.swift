//
//  ViewThree.swift
//  ViewBuilderTape
//
//  Created by Sraavan Chevireddy on 5/16/21.
//

import SwiftUI

struct ViewThree: View {
    @State var isShowing : Bool = false
    var body: some View {
        NavigationView{
            
            ZStack(alignment: .center, content: {
                Color.green
                if isShowing{
                    ProgressView {
                        Text("Fetching Cases for Awaiting Report Dictation")
                    }.shadow(radius: 5)
                    .zIndex(1.0)// Keeping zindex as one. Will always keep the view to be on top...
                    .transition(.move(edge: .top))
                    .animation(.spring())
                }
                
                GenericHudView(isShowing: $isShowing) {
                    Text("Heads Up Display!").padding()
                        .navigationTitle("Heads up title")
                    Button(action: {
                        isShowing.toggle()
                    }, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/.foregroundColor(.white)
                    })
                }
            })
            
        }
    }
}

struct ViewThree_Previews: PreviewProvider {
    static var previews: some View {
        ViewThree()
    }
}

struct GenericHudView<Content: View> : View{
    let content : Content
    @Binding var isShowingHud :Bool
    
    init(isShowing:Binding<Bool>,@ViewBuilder content: () -> Content){
        self._isShowingHud = isShowing
        self.content = content()
    }
    
    var body: some View{
        GenericContainer {
            content
        }
        Spacer()
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isShowingHud.toggle()
                    }
                }
            })
    }
}
