import SwiftUI

extension View {
    public func cocoa<T: CocoaView>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: handler)
    }

    public func cocoa<T: CocoaViewController>(for type: T.Type, _ handler: @escaping ((T) -> Void)) -> CocoaBridgeView<Self, T> {
        CocoaBridgeView(self, customize: handler)
    }
}

extension ScrollView: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaScrollView
}

extension List: DefaultCocoaViewBridging {
    #if canImport(UIKit)
    /// NOTE: Definition for iOS 16 or later
    /// < iOS16 `UITableView`
    public typealias DefaultCocoaViewType = UICollectionView
    #elseif canImport(Cocoa)
    public typealias DefaultCocoaViewType = NSTableView
    #endif
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(tvOS 14.0, *)
extension ProgressView: DefaultCocoaViewBridging {
#if canImport(UIKit)
    public typealias DefaultCocoaViewType = UIProgressView
#elseif canImport(Cocoa)
    public typealias DefaultCocoaViewType = NSProgressIndicator
#endif
}


extension TextField: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaTextField
}

extension SecureField: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaTextField
}

extension Picker: DefaultCocoaViewBridging {
#if canImport(UIKit) && os(iOS)
    public typealias DefaultCocoaViewType = UIPickerView
#elseif canImport(Cocoa)
    public typealias DefaultCocoaViewType = NSButton
#elseif canImport(UIKit) && os(tvOS)
    public typealias DefaultCocoaViewType = UISegmentedControl
#endif
}

// MARK: - iOS and tvOS only
#if os(iOS) || os(tvOS)
extension Form: DefaultCocoaViewBridging {
#if os(iOS)
    /// NOTE: Definition for iOS 16 or later
    /// < iOS16 `UITableView`
    public typealias DefaultCocoaViewType = UICollectionView
#elseif os(tvOS)
    public typealias DefaultCocoaViewType = UITableView
#endif
}
#endif

// MARK: - macOS and iOS only
#if os(iOS) || os(macOS)
extension Slider: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaSlider
}

extension Stepper: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaStepper
}

extension DatePicker: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaDatePicker
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension ColorPicker: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaColorWell
}

extension Toggle: DefaultCocoaViewBridging {
    /// NOTE: Depending on the `ToggleStyle`, Cocoa types are different.
#if canImport(UIKit)
    public typealias DefaultCocoaViewType = UISwitch
#elseif canImport(Cocoa)
    public typealias DefaultCocoaViewType = NSButton
#endif
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension TextEditor: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaTextView
}
#endif

// MARK: - iOS only
#if os(iOS)
@available(iOS 16.0, *)
extension MultiDatePicker: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = UICalendarView
}
#endif

// MARK: - macOS only
#if os(macOS) && canImport(Cocoa)
extension Button: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = NSButton
}
#endif

// MARK: - Tab and Navigation
#if canImport(UIKit)
extension TabView: DefaultCocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UITabBarController
}
#elseif canImport(Cocoa)
extension TabView: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = NSTabView
}
#endif

#if canImport(UIKit) && os(iOS)
extension NavigationView: DefaultCocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UISplitViewController
}
#elseif canImport(Cocoa)
extension NavigationView: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = NSSplitView
}
#elseif canImport(UIKit) && os(tvOS)
extension NavigationView: DefaultCocoaViewControllerBridging {
    public typealias DefaultCocoaViewType = UINavigationController
}
#endif

#if canImport(UIKit)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationStack: DefaultCocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UINavigationController
}
#elseif canImport(Cocoa)
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension NavigationStack: DefaultCocoaViewBridging {
//    public typealias DefaultCocoaType = CocoaView
//}
#endif

#if os(iOS) || os(macOS)
#if canImport(UIKit)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationSplitView: DefaultCocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UISplitViewController
}
#elseif canImport(Cocoa)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationSplitView: DefaultCocoaViewBridging {
    public typealias DefaultCocoaViewType = NSSplitView
}
#endif
#endif
