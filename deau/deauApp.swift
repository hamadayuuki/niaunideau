//
//  deauApp.swift
//  deau
//
//  Created by 濵田　悠樹 on 2024/11/26.
//

import SwiftUI

@main
struct deauApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            CoordinateRecommendView()
        }
    }
}
