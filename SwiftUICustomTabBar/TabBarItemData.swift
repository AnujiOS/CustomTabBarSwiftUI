//
//  TabBarPreferenceKey.swift
//  SwiftUICustomTabBar
//
//  Created by Anuj Joshi on 06/10/2020.
//

import SwiftUI

struct TabBarItemData {
    var tag: Int
    var content: AnyView
}

struct TabBarPreferenceData {
    var tabBarBounds: Anchor<CGRect>? = nil
    var tabBarItemData: [TabBarItemData] = []
}

struct TabBarPreferenceKey: PreferenceKey {
    typealias Value = TabBarPreferenceData

    static var defaultValue: TabBarPreferenceData = TabBarPreferenceData()

    static func reduce(value: inout TabBarPreferenceData, nextValue: () -> TabBarPreferenceData) {
        if let tabBarBounds = nextValue().tabBarBounds {
            value.tabBarBounds = tabBarBounds
        }
        value.tabBarItemData.append(contentsOf: nextValue().tabBarItemData)
    }
}
