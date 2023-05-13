//
//  OverlayHostingController.swift
//  
//
//  Created by p-x9 on 2023/04/02.
//  
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

final public class OverlayHostingController<Content: View>: CocoaHostingController<Content> {

    var updateHandler: ((OverlayHostingController) -> Void)?
    var shouldUpdate = true

    var onViewWillAppear: ((OverlayHostingController) -> Void)?
    var onViewDidAppear: ((OverlayHostingController) -> Void)?
    var onViewWillDisappear: ((OverlayHostingController) -> Void)?
    var onViewDidDisappear: ((OverlayHostingController) -> Void)?

#if canImport(UIKit)
    public override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        updateHandler?(self)
        shouldUpdate = true
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if shouldUpdate {
            updateHandler?(self)
            shouldUpdate = false
        } else {
            shouldUpdate = true
        }
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        onViewWillAppear?(self)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        updateHandler?(self)
        shouldUpdate = true

        onViewDidAppear?(self)
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        onViewWillDisappear?(self)
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        onViewDidDisappear?(self)
    }
#elseif canImport(Cocoa)
    public override func viewDidLayout() {
        super.viewDidLayout()

        if shouldUpdate {
            updateHandler?(self)
            shouldUpdate = false
        } else {
            shouldUpdate = true
        }
    }

    public override func viewWillAppear() {
        super.viewWillAppear()

        onViewWillAppear?(self)
    }

    public override func viewDidAppear() {
        super.viewDidAppear()

        updateHandler?(self)
        shouldUpdate = true
        onViewDidAppear?(self)
    }

    public override func viewWillDisappear() {
        super.viewWillDisappear()

        onViewWillDisappear?(self)
    }

    public override func viewDidDisappear() {
        super.viewDidDisappear()

        onViewDidDisappear?(self)
    }
#endif
}
