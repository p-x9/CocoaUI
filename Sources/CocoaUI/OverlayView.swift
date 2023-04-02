//
//  OverlayView.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

import Foundation
import UIKit

struct OverlayView<Content: CocoaBridging, CocoaType: CocoaView>: CocoaViewControllerRepresentable {
    let content: () -> Content
    let customize: (CocoaType) -> Void
#if canImport(UIKit)
    typealias UIViewControllerType = OverlayHostingController<Content>

    init(for type: CocoaType.Type, content: @escaping () -> Content, customize: @escaping (CocoaType) -> Void) {
        self.content = content
        self.customize = customize
    }

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
#endif
}
