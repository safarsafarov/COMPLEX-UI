//
//  ContentView.swift
//  complex-UI
//
//  Created by codestorm on 2021/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    @State var menu = 0
    @State var page = 0
    
    var body: some View {
        ZStack {
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack {
                
            }
        }
    }
}
