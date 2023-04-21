//
//  CocoaViewBridgeView.swift
//  
//
//  Created by p-x9 on 2023/04/21.
//  
//

import SwiftUI

public struct CocoaBridgeView<Content: View, CocoaType: NSObject>: View {
    let content: Content
    let customize: (CocoaType) -> Void

    var onViewWillAppear: ((CocoaType?) -> Void)?
    var onViewDidAppear: ((CocoaType?) -> Void)?
    var onViewWillDisappear: ((CocoaType?) -> Void)?
    var onViewDidDisappear: ((CocoaType?) -> Void)?

    init(_ content: Content, customize: @escaping ((CocoaType) -> Void)) {
        self.content = content
        self.customize =  customize
    }

    public var body: some View {
        content
            .hidden()
            .allowsHitTesting(true)
            .overlay(
                OverlayView(
                    for: CocoaType.self,
                    content: {
                        content
                    },
                    customize: customize
                )
                .onViewWillAppear(onViewWillAppear)
                .onViewDidAppear(onViewDidAppear)
                .onViewWillDisappear(onViewWillDisappear)
                .onViewDidDisappear(onViewDidDisappear)
            )
    }
}

extension CocoaBridgeView {
    public func onViewWillAppear(_ handler: @escaping (CocoaType?) -> Void) -> Self {
        set(handler, for: \.onViewWillAppear)
    }

    public func onViewDidAppear(_ handler: @escaping (CocoaType?) -> Void) -> Self {
        set(handler, for: \.onViewDidAppear)
    }

    public func onViewWillDisappear(_ handler: @escaping (CocoaType?) -> Void) -> Self {
        set(handler, for: \.onViewWillDisappear)
    }

    public func onViewDidDisappear(_ handler: @escaping (CocoaType?) -> Void) -> Self {
        set(handler, for: \.onViewDidDisappear)
    }
}
