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

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        updateHandler?(self)
        shouldUpdate = true
    }
#endif
}
