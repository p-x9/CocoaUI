//
//  View+.swift
//  
//
//  Created by p-x9 on 2023/04/01.
//  
//
import SwiftUI

extension CocoaView {
    func find<T>(for type: T.Type) -> T? {
        for subview in subviews {
            if let typed = subview as? T {
                return typed
            } else if let typed = subview.find(for: type) {
                return typed
            }
        }
        return self as? T
    }
}

extension CocoaViewController {
    func find<T>(for type: T.Type) -> T? {
        for child in children {
            if let typed = child as? T {
                return typed
            } else if let typed = child.find(for: type) {
                return typed
            }
        }
        return self as? T
    }
}

extension View {
    func set<T>(_ value: T, for keyPath: WritableKeyPath<Self, T>) -> Self {
        var new = self
        new[keyPath: keyPath] = value
        return new
    }
}
