//
//  ContentView.swift
//  ViewBuilderTape
//
//  Created by Sraavan Chevireddy on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                ViewOne().tabItem {
                    Text("One")
                }
                
                ViewTwo().tabItem {
                    Text("Two")
                }
                
                ViewThree().tabItem {
                    Text("Three")
                }
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
