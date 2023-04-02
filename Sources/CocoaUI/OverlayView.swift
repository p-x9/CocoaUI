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
    let customize: (CocoaType) -> Void

    init(for type: CocoaType.Type, content: @escaping () -> Content, customize: @escaping (CocoaType) -> Void) {
        self.content = content
        self.customize = customize
    }

    func update(_ controller: CocoaViewController) {
        if CocoaType.isSubclass(of: CocoaView.self) {
            guard let typed = controller.view.find(for: CocoaType.self) else {
                return
            }
            customize(typed)
        }

        if CocoaType.isSubclass(of: CocoaViewController.self) {
            guard let typed = controller.find(for: CocoaType.self) else {
                return
            }
            customize(typed)
        }
    }

#if canImport(UIKit)
    typealias UIViewControllerType = OverlayHostingController<Content>

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let controller = OverlayHostingController(rootView: content())
        controller.updateHandler = { controller in
            update(controller)
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        DispatchQueue.main.async {
            update(uiViewController)
            uiViewController.shouldUpdate = true
        }
    }
#elseif canImport(Cocoa)
    typealias NSViewControllerType = OverlayHostingController<Content>

    func makeNSViewController(context: Context) -> NSViewControllerType {
        let controller = OverlayHostingController(rootView: content())
        controller.updateHandler = { controller in
            update(controller)
        }
        return controller
    }

    func updateNSViewController(_ nsViewController: NSViewControllerType, context: Context) {
        DispatchQueue.main.async {
            update(nsViewController)
            nsViewController.shouldUpdate = true
        }
    }
#endif
}
