//
//  View1.swift
//  EnvObjectExp
//
//  Created by Akash Pal on 16/08/23.
//

import SwiftUI

struct View1: View {
    
    @EnvironmentObject var router: NavRouter
    @State private var incrementer = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("I'm view 1")
                .font(.title2)
            Button("Click Me 1") {
                let navData = NavData(content: AnyView(View2()) )
                router.push(to: navData)
            }
            
            HStack {
                Button("Add") {
                    incrementer += 1
                }
                .padding(15)
                .background(Color.primary)
                Spacer()
                Text(String(format: "%d", incrementer))
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(15)
                    .background(Color.yellow)
            }
        }
        .navigationDestination(for: String.self) { index in
            if index == "2" {
                View2()
            }
        }
        .navigationTitle("View 1")
        .navigationBarTitleDisplayMode(.automatic)
        
        
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
            .preferredColorScheme(.dark)
    }
}

