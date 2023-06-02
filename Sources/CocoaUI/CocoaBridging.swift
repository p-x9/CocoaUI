//
//  CocoaViewBridging.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

import SwiftUI

// MARK: View ⇄ CocoaView
public protocol DefaultCocoaViewBridging: SwiftUI.View {
    associatedtype DefaultCocoaViewType: CocoaView
}

extension DefaultCocoaViewBridging {
    public func cocoa(
        customize: ((DefaultCocoaViewType) -> Void)? = nil
    ) -> CocoaBridgeView<Self, DefaultCocoaViewType> {
        CocoaBridgeView(self, customize: customize)
    }

    public func cocoa(
        customize: ((DefaultCocoaViewType) -> Void)? = nil,
        onViewWillAppear: ((DefaultCocoaViewType?) -> Void)? = nil,
        onViewDidAppear: ((DefaultCocoaViewType?) -> Void)? = nil,
        onViewWillDisappear: ((DefaultCocoaViewType?) -> Void)? = nil,
        onViewDidDisappear: ((DefaultCocoaViewType?) -> Void)? = nil
    ) -> CocoaBridgeView<Self, DefaultCocoaViewType> {
        CocoaBridgeView(
            self,
            customize: customize,
            onViewWillAppear: onViewWillAppear,
            onViewDidAppear: onViewDidAppear,
            onViewWillDisappear: onViewWillDisappear,
            onViewDidDisappear: onViewDidDisappear
        )
    }
}

// MARK: View ⇄ CocoaViewController
public protocol DefaultCocoaViewControllerBridging: SwiftUI.View  {
    associatedtype DefaultCocoaControllerType: CocoaViewController
}

extension DefaultCocoaViewControllerBridging {
    public func cocoa(
        customize: ((DefaultCocoaControllerType) -> Void)? = nil
    ) -> CocoaBridgeView<Self, DefaultCocoaControllerType> {
        CocoaBridgeView(self, customize: customize)
    }

    public func cocoa(
        customize: ((DefaultCocoaControllerType) -> Void)? = nil,
        onViewWillAppear: ((DefaultCocoaControllerType?) -> Void)? = nil,
        onViewDidAppear: ((DefaultCocoaControllerType?) -> Void)? = nil,
        onViewWillDisappear: ((DefaultCocoaControllerType?) -> Void)? = nil,
        onViewDidDisappear: ((DefaultCocoaControllerType?) -> Void)? = nil
    ) -> CocoaBridgeView<Self, DefaultCocoaControllerType> {
        CocoaBridgeView(
            self,
            customize: customize,
            onViewWillAppear: onViewWillAppear,
            onViewDidAppear: onViewDidAppear,
            onViewWillDisappear: onViewWillDisappear,
            onViewDidDisappear: onViewDidDisappear
        )
    }
}

// MARK: any View
extension View {
    public func cocoa<T: CocoaView>(
        for type: T.Type,
        customize: ((T) -> Void)? = nil,
        onViewWillAppear: ((T?) -> Void)? = nil,
        onViewDidAppear: ((T?) -> Void)? = nil,
        onViewWillDisappear: ((T?) -> Void)? = nil,
        onViewDidDisappear: ((T?) -> Void)? = nil
    ) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(
            self,
            customize: customize,
            onViewWillAppear: onViewWillAppear,
            onViewDidAppear: onViewDidAppear,
            onViewWillDisappear: onViewWillDisappear,
            onViewDidDisappear: onViewDidDisappear
        )
    }

    public func cocoa<T: CocoaView>(
        for type: T.Type,
        customize: @escaping ((T) -> Void)
    ) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: customize)
    }

    public func cocoa<T: CocoaViewController>(
        for type: T.Type,
        customize: ((T) -> Void)? = nil,
        onViewWillAppear: ((T?) -> Void)? = nil,
        onViewDidAppear: ((T?) -> Void)? = nil,
        onViewWillDisappear: ((T?) -> Void)? = nil,
        onViewDidDisappear: ((T?) -> Void)? = nil
    ) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(
            self,
            customize: customize,
            onViewWillAppear: onViewWillAppear,
            onViewDidAppear: onViewDidAppear,
            onViewWillDisappear: onViewWillDisappear,
            onViewDidDisappear: onViewDidDisappear
        )
    }

    public func cocoa<T: CocoaViewController>(
        for type: T.Type,
        customize: @escaping ((T) -> Void)
    ) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: customize)
    }
}
