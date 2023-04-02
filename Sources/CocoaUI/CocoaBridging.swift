//
//  CocoaBridging.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

import SwiftUI

public protocol CocoaBridging: SwiftUI.View {
    associatedtype DefaultCocoaType: CocoaView
}

extension CocoaBridging {
    public func cocoa(_ handler: @escaping ((DefaultCocoaType) -> Void)) -> some View {
        inject(type: DefaultCocoaType.self, handler: handler)
    }

    public func cocoa<T: CocoaView>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> some View {
        inject(type: type, handler: handler)
    }
}

extension CocoaBridging {
    private func inject<T: CocoaView>(type: T.Type, handler: @escaping ((T) -> Void)) -> some View {
        self
            .hidden()
            .allowsHitTesting(true)
            .overlay(OverlayView(
                for: type,
                content: {
                    self
                }, customize: {
                    handler($0)
                }))
    }
}
