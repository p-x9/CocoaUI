//
//  OverlayView.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

import Foundation

struct OverlayView<Content: CocoaBridging, CocoaType: CocoaView>: CocoaViewControllerRepresentable {
    let content: () -> Content
    let customize: (CocoaType) -> Void

    init(for type: CocoaType.Type, content: @escaping () -> Content, customize: @escaping (CocoaType) -> Void) {
        self.content = content
        self.customize = customize
    }

#if canImport(UIKit)
    typealias UIViewControllerType = OverlayHostingController<Content>

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let controller = OverlayHostingController(rootView: content())
        controller.updateHandler = { controller in
            guard let typed = controller.view.findChild(for: CocoaType.self) else {
                return
            }
            customize(typed)
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        DispatchQueue.main.async {
            guard let typed = uiViewController.view.findChild(for: CocoaType.self) else {
                return
            }
            customize(typed)
            uiViewController.shouldUpdate = true
        }
    }
#elseif canImport(Cocoa)
    typealias NSViewControllerType = OverlayHostingController<Content>

    func makeNSViewController(context: Context) -> NSViewControllerType {
        let controller = OverlayHostingController(rootView: content())
        controller.updateHandler = { controller in
            guard let typed = controller.view.findChild(for: CocoaType.self) else {
                return
            }
            customize(typed)
        }
        return controller
    }

    func updateNSViewController(_ nsViewController: NSViewControllerType, context: Context) {
        DispatchQueue.main.async {
            guard let typed = nsViewController.view.findChild(for: CocoaType.self) else {
                return
            }
            customize(typed)
            nsViewController.shouldUpdate = true
        }
    }
#endif
}
