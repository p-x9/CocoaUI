//
//  CocoaViewBridging.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

import SwiftUI

public protocol CocoaViewBridging: SwiftUI.View {
    associatedtype DefaultCocoaViewType: CocoaView
}

extension CocoaViewBridging {
    public func cocoa(_ handler: @escaping ((DefaultCocoaViewType) -> Void)) -> some View {
        inject(type: DefaultCocoaViewType.self, handler: handler)
    }

    public func cocoa<T: CocoaView>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> some View {
        inject(type: type, handler: handler)
    }
}

extension CocoaViewBridging {
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

public protocol CocoaViewControllerBridging: SwiftUI.View {
    associatedtype DefaultCocoaControllerType: CocoaViewController
}

extension CocoaViewControllerBridging {
    public func cocoa(_ handler: @escaping ((DefaultCocoaControllerType) -> Void)) -> some View {
        inject(type: DefaultCocoaControllerType.self, handler: handler)
    }

    public func cocoa<T: CocoaViewController>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> some View {
        inject(type: type, handler: handler)
    }
}

extension CocoaViewControllerBridging {
    private func inject<T: CocoaViewController>(type: T.Type, handler: @escaping ((T) -> Void)) -> some View {
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
