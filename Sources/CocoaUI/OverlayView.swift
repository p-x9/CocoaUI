//
//  OverlayView.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

import SwiftUI

struct OverlayView<Content: View, CocoaType: NSObject>: CocoaViewControllerRepresentable {
    let content: () -> Content
    var customize: ((CocoaType) -> Void)?

    var onViewWillAppear: ((CocoaType?) -> Void)?
    var onViewDidAppear: ((CocoaType?) -> Void)?
    var onViewWillDisappear: ((CocoaType?) -> Void)?
    var onViewDidDisappear: ((CocoaType?) -> Void)?

    init(
        for type: CocoaType.Type,
        content: @escaping () -> Content,
        customize: ((CocoaType) -> Void)?,
        onViewWillAppear: ((CocoaType?) -> Void)?,
        onViewDidAppear: ((CocoaType?) -> Void)?,
        onViewWillDisappear: ((CocoaType?) -> Void)?,
        onViewDidDisappear: ((CocoaType?) -> Void)?
    ) {
        self.content = content
        self.customize = customize
        self.onViewWillAppear = onViewWillAppear
        self.onViewDidAppear = onViewDidAppear
        self.onViewWillDisappear = onViewWillDisappear
        self.onViewDidDisappear = onViewDidDisappear
    }

    func findTarget(from controller: CocoaViewController) -> CocoaType? {
        if CocoaType.isSubclass(of: CocoaView.self) {
            return controller.view.find(for: CocoaType.self)
        }

        if CocoaType.isSubclass(of: CocoaViewController.self) {
            return controller.find(for: CocoaType.self)
        }
        return nil
    }

    func customize(_ controller: CocoaViewController) {
        guard let target = findTarget(from: controller) else {
            return
        }
        customize?(target)
    }

    func updateHandlers(for controller: OverlayHostingController<Content>) {
        controller.updateHandler = { controller in
            customize(controller)
        }

        controller.onViewWillAppear = { controller in
            let target = findTarget(from: controller)
            onViewWillAppear?(target)
        }

        controller.onViewDidAppear = { controller in
            let target = findTarget(from: controller)
            onViewDidAppear?(target)
        }

        controller.onViewWillDisappear = { controller in
            let target = findTarget(from: controller)
            onViewWillDisappear?(target)
        }

        controller.onViewDidDisappear = { controller in
            let target = findTarget(from: controller)
            onViewDidDisappear?(target)
        }
    }

#if canImport(UIKit)
    typealias UIViewControllerType = OverlayHostingController<Content>

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let controller = OverlayHostingController(rootView: content())
        controller.view.backgroundColor = .clear
        updateHandlers(for: controller)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        updateHandlers(for: uiViewController)

        DispatchQueue.main.async {
            uiViewController.rootView = content()
            uiViewController.view.backgroundColor = .clear
            customize(uiViewController)
            uiViewController.shouldUpdate = true
        }
    }
#elseif canImport(Cocoa)
    typealias NSViewControllerType = OverlayHostingController<Content>

    func makeNSViewController(context: Context) -> NSViewControllerType {
        let controller = OverlayHostingController(rootView: content())
        updateHandlers(for: controller)
        return controller
    }

    func updateNSViewController(_ nsViewController: NSViewControllerType, context: Context) {
        updateHandlers(for: nsViewController)

        DispatchQueue.main.async {
            nsViewController.rootView = content()
            customize(nsViewController)
            nsViewController.shouldUpdate = true
        }
    }
#endif
}

extension OverlayView {
    func customize(_ handler: ((CocoaType) -> Void)?) -> Self {
        set(handler, for: \.customize)
    }

    func onViewWillAppear(_ handler: ((CocoaType?) -> Void)?) -> Self {
        set(handler, for: \.onViewWillAppear)
    }

    func onViewDidAppear(_ handler: ((CocoaType?) -> Void)?) -> Self {
        set(handler, for: \.onViewDidAppear)
    }

    func onViewWillDisappear(_ handler: ((CocoaType?) -> Void)?) -> Self {
        set(handler, for: \.onViewWillDisappear)
    }

    func onViewDidDisappear(_ handler: ((CocoaType?) -> Void)?) -> Self {
        set(handler, for: \.onViewDidDisappear)
    }
}
