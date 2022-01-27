//
//  ContentView.swift
//  M4L3
//
//  Created by ZhangTommy on 28/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab = 1
    
    var list = [String]()
    
    init() {
        for _ in 0...9 {
            list.append("This is tab 3!")
        }
    }
    var body: some View {
        NavigationView {
            TabView(selection: $currentTab) {
                
                Text("This tab’s tag is \(currentTab).").tabItem {
                    VStack {
                        Image(systemName: "tortoise")
                        Text("Zhenyu")
                    }
                    
                }.tag(1)
                
                Button("Take me to tab 3!") {
                    currentTab = 3
                }.tabItem { VStack {
                    Image(systemName: "arrowshape.zigzag.right")
                    Text("Tab 2")
                }
                    
                }.tag(2)
                
                
                List {
                    ForEach(list,id: \.self) { t in
                        Text(t)
                    }
                }.tabItem {
                    VStack {
                        Image(systemName: "hands.clap")
                        Text("Tab 3")
                    }
                    
                }.tag(3)
            }.navigationTitle("Zhenyu 🐢")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
