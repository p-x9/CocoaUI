//
//  View+.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//

extension CocoaView {
    func findChild<T>(for type: T.Type) -> T? {
        for subview in subviews {
            if let typed = subview as? T {
                return typed
            } else if let typed = subview.findChild(for: type) {
                return typed
            }
        }
        return self as? T
    }
}
