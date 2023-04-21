//
//  CocoaViewBridging.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

import SwiftUI

public protocol CocoaViewBridging: SwiftUI.View {
    associatedtype DefaultCocoaType: CocoaView
}

extension CocoaViewBridging {
    public func cocoa(_ handler: @escaping ((DefaultCocoaType) -> Void)) -> CocoaBridgeView<Self, DefaultCocoaType> {
        inject(type: DefaultCocoaType.self, handler: handler)
    }

    public func cocoa<T: CocoaView>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        inject(type: type, handler: handler)
    }
}

extension CocoaViewBridging {
    private func inject<T: CocoaView>(type: T.Type, handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: handler)
    }
}

public protocol CocoaViewControllerBridging: SwiftUI.View {
    associatedtype DefaultCocoaType: CocoaViewController
}

extension CocoaViewControllerBridging {
    public func cocoa(_ handler: @escaping ((DefaultCocoaType) -> Void)) -> CocoaBridgeView<Self, DefaultCocoaType> {
        inject(type: DefaultCocoaType.self, handler: handler)
    }

    public func cocoa<T: CocoaViewController>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        inject(type: type, handler: handler)
    }
}

extension CocoaViewControllerBridging {
    private func inject<T: CocoaViewController>(type: T.Type, handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: handler)
    }
}
