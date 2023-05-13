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
    public func cocoa(_ handler: @escaping ((DefaultCocoaViewType) -> Void)) -> CocoaBridgeView<Self, DefaultCocoaViewType> {
        CocoaBridgeView(self, customize: handler)
    }
}

// MARK: View ⇄ CocoaViewController
public protocol DefaultCocoaViewControllerBridging: SwiftUI.View  {
    associatedtype DefaultCocoaControllerType: CocoaViewController
}

extension DefaultCocoaViewControllerBridging {
    public func cocoa(_ handler: @escaping ((DefaultCocoaControllerType) -> Void)) -> CocoaBridgeView<Self, DefaultCocoaControllerType> {
        CocoaBridgeView(self, customize: handler)
    }
}
