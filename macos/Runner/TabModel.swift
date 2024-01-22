//
//  TabModel.swift
//  Runner
//
//  Created by Personal on 22/01/24.
//

import FlutterMacOS
import Foundation
import SwiftUI

/// Model
class TabModel: ObservableObject {
    var channel: FlutterMethodChannel?

    @Published private(set) var activeTab: Tab = .home
    @Published private(set) var isTabBarAdded: Bool = false
    @Published var hideTabBar: Bool = false

    func addTabBar(_ applicationWindow: NSWindow) {
        guard !isTabBarAdded else { return }

        let customTabBar = NSHostingView(rootView: TabBarView().environmentObject(self))
        let floatingWindow = NSWindow()
        floatingWindow.styleMask = .borderless
        floatingWindow.contentView = customTabBar
        floatingWindow.backgroundColor = .clear
        floatingWindow.title = "tabBarView"

        let windowSize = applicationWindow.frame.size
        let windowOrigin = applicationWindow.frame.origin

        floatingWindow.setFrameOrigin(.init(x: windowOrigin.x - 45, y: windowOrigin.y + (windowSize.height - 180) / 2))

        applicationWindow.addChildWindow(floatingWindow, ordered: .above)
        isTabBarAdded.toggle()
    }

    func toggleVisibility() {
        hideTabBar.toggle()
    }

    func setActiveTab(_ tab: Tab) {
        activeTab = tab
        channel?.invokeMethod("setActiveTabBarIndex", arguments: ["index": Tab.allCases.firstIndex(of: tab)])
    }
}
