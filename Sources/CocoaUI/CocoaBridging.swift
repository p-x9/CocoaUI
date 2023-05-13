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
    public func cocoa(_ handler: @escaping ((DefaultCocoaViewType) -> Void)) -> CocoaBridgeView<Self, DefaultCocoaViewType> {
        CocoaBridgeView(self, customize: handler)
    }

    public func cocoa<T: CocoaView>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: handler)
    }
}

public protocol CocoaViewControllerBridging: SwiftUI.View {
    associatedtype DefaultCocoaControllerType: CocoaViewController
}

extension CocoaViewControllerBridging {
    public func cocoa(_ handler: @escaping ((DefaultCocoaControllerType) -> Void)) -> CocoaBridgeView<Self, DefaultCocoaControllerType> {
        CocoaBridgeView(self, customize: handler)
    }

    public func cocoa<T: CocoaViewController>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: handler)
    }
}
