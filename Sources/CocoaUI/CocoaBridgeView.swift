//
//  CocoaBridgeView.swift
//  
//
//  Created by p-x9 on 2023/04/21.
//  
//

import SwiftUI

public struct CocoaBridgeView<Content: View, CocoaType: NSObject>: View {
    let content: Content
    var customize: ((CocoaType) -> Void)?

    var onViewWillAppear: ((CocoaType?) -> Void)?
    var onViewDidAppear: ((CocoaType?) -> Void)?
    var onViewWillDisappear: ((CocoaType?) -> Void)?
    var onViewDidDisappear: ((CocoaType?) -> Void)?

    init(_ content: Content,
         customize: ((CocoaType) -> Void)? = nil,
         onViewWillAppear: ((CocoaType?) -> Void)? = nil,
         onViewDidAppear: ((CocoaType?) -> Void)? = nil,
         onViewWillDisappear: ((CocoaType?) -> Void)? = nil,
         onViewDidDisappear: ((CocoaType?) -> Void)? = nil
    ) {
        self.content = content
        self.customize =  customize
        self.onViewWillAppear = onViewWillAppear
        self.onViewDidAppear = onViewDidAppear
        self.onViewWillDisappear = onViewWillDisappear
        self.onViewDidDisappear = onViewDidDisappear
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
                    customize: customize,
                    onViewWillAppear: onViewWillAppear,
                    onViewDidAppear: onViewDidAppear,
                    onViewWillDisappear: onViewWillDisappear,
                    onViewDidDisappear: onViewDidDisappear
                )
            )
    }
}

extension CocoaBridgeView {
    public func customize(_ handler: @escaping (CocoaType) -> Void) -> Self {
        set(handler, for: \.customize)
    }

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
