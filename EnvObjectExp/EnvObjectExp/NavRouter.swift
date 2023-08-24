//
//  NavRouter.swift
//  EnvObjectExp
//
//  Created by Akash Pal on 21/08/23.
//

import Foundation
import SwiftUI

struct NavData: Hashable {
    
    private let uid = UUID().uuidString
    let content: AnyView
    
    
    static func == (lhs: NavData, rhs: NavData) -> Bool {
        lhs.uid == rhs.uid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
}

final class NavRouter: ObservableObject {
    
    @Published var path = NavigationPath()

    func push(to data: NavData) {
        path.append(data)
    }
    
    func back() {
        path.removeLast()
    }
    
//    func pop(to view: any HashableView) {
//        path
//    }
    
    func backToRoot() {
        path = NavigationPath()
    }

}



