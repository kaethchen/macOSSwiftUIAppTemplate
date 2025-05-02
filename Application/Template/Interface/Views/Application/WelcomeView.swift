//
//  WelcomeView.swift
//  Template
//
//  Created by Alexandra Göttlicher
//

import SwiftUI

internal struct WelcomeView: View {
    private var version: String {
        let versionText: String = NSLocalizedString("WELCOME_VERSION", comment: "")
        let versionDebugText: String = NSLocalizedString("WELCOME_VERSION_DEBUG", comment: "")
        var string: String = "\(versionText): " + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
        #if DEBUG
            string += " \(versionDebugText)"
        #endif
        return string
    }

    internal var body: some View {
        IntroductionView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                VStack {
                    Spacer()
                    Text(self.version)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .opacity(0.4)
                }
                .padding()
            )
    }
}

private struct IntroductionView: View {
    internal var body: some View {
        VStack {
            Image(nsImage: NSImage(named: "AppIcon") ?? NSImage())
                .antialiased(true)
                .frame(width: UIBridge.kAppIconSizeWelcome, height: UIBridge.kAppIconSizeWelcome)

            Text("META_PROJECT_NAME")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
            Text(String(format: NSLocalizedString("WELCOME_BY", comment: ""), NSLocalizedString("META_AUTHOR", comment: "")))
                .font(.headline)
                .fontWeight(.regular)
                .fontDesign(.rounded)
                .padding(.bottom, UIBridge.kItemSpacing)
                .opacity(0.6)
        }
    }
}
