//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by 林楷祐 on 2024/9/5.
//

import SwiftUI

@main
struct MemoAppApp: App {
    @StateObject var listViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(listViewModel)
        }
    }
}
