//
//  ContentView.swift
//  EnvObjectExp
//
//  Created by Akash Pal on 16/08/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var router = NavRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Button("Click Me") {
                    let navData = NavData(content: AnyView(View1()) )
                    router.push(to: navData)
                }
                
            }
            .navigationDestination(for: NavData.self, destination: { data in
//                Text("Test")
                data.content
            })
            .navigationTitle("ENV Object")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(router)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(NavRouter())
    }
}
