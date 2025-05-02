//
//  NavigationView.swift
//  Template
//
//  Created by Alexandra Göttlicher
//

import SwiftUI

enum SidebarItem: Hashable {
    case welcome
}

internal struct SidebarView: View {
    @ObservedObject internal var model: NavigationSplitViewModel
    @FocusState private var textFieldFocused: Bool

    internal var body: some View {
        List(selection: Binding(get: {
            return self.model.selectedTab
        }, set: { value in
            DispatchQueue.main.async {
                self.model.selectedTab = value
            }
        })) {
            Section {
                Label("SIDEBAR_WELCOME", systemImage: "sun.min.fill")
                    .tag(SidebarItem.welcome)
            }
        }
        .frame(minWidth: 200)
        .foregroundStyle(Color.primary)
    }
}
