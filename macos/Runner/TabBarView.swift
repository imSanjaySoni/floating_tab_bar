//
//  TabBarView.swift
//  Runner
//
//  Created by Personal on 21/01/24.
//

import FlutterMacOS
import SwiftUI

/// Tabs
enum Tab: String, CaseIterable {
    case home = "house.fill"
    case favorites = "suit.heart.fill"
    case notifications = "bell.fill"
    case settings = "gearshape"
}

struct TabBarView: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var tabModel: TabModel
    @Namespace private var animation

    private let animationID: UUID = .init()

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Button {
                    tabModel.setActiveTab(tab)
                } label: {
                    Image(systemName: tab.rawValue)
                        .font(.title3)
                        .foregroundStyle(tabModel.activeTab == tab ? (colorScheme == .dark ? .black : .white) : .primary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            if tabModel.activeTab == tab {
                                Circle()
                                    .fill(.primary)
                                    .matchedGeometryEffect(id: animationID, in: animation)
                            }
                        }
                        .contentShape(.rect)
                        .animation(.bouncy, value: tabModel.activeTab)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(5)
        .frame(width: 45, height: 180)
        .background(.background)
        .clipShape(.capsule)
        .contentShape(.capsule)
        .offset(x: tabModel.hideTabBar ? 60 : 0)
        .animation(.snappy, value: tabModel.hideTabBar)
    }
}

#Preview {
    TabBarView().environmentObject(TabModel())
}
