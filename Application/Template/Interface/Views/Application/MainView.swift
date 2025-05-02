//
//  MainView.swift
//  Template
//
//  Created by Alexandra Göttlicher
//

import SwiftUI
import Combine

internal struct MainView: View {
    @StateObject private var model: NavigationSplitViewModel = NavigationSplitViewModel()

    internal var body: some View {
        NavigationSplitView(sidebar: {
            SidebarView(model: self.model)
        }, detail: {
            switch self.model.selectedTab {
                case .welcome:
                    WelcomeView()
            }
        })
    }
}

internal class NavigationSplitViewModel: ObservableObject {
    @Published internal var selectedTab: SidebarItem = .welcome
}
