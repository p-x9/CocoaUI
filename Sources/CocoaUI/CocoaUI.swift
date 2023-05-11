import SwiftUI

extension ScrollView: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaScrollView
}

extension List: CocoaViewBridging {
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
extension ProgressView: CocoaViewBridging {
#if canImport(UIKit)
    public typealias DefaultCocoaViewType = UIProgressView
#elseif canImport(Cocoa)
    public typealias DefaultCocoaViewType = NSProgressIndicator
#endif
}


extension TextField: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaTextField
}

extension SecureField: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaTextField
}

extension Picker: CocoaViewBridging {
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
extension Form: CocoaViewBridging {
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
extension Slider: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaSlider
}

extension Stepper: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaStepper
}

extension DatePicker: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaDatePicker
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension ColorPicker: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaColorWell
}

extension Toggle: CocoaViewBridging {
    /// NOTE: Depending on the `ToggleStyle`, Cocoa types are different.
#if canImport(UIKit)
    public typealias DefaultCocoaViewType = UISwitch
#elseif canImport(Cocoa)
    public typealias DefaultCocoaViewType = NSButton
#endif
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension TextEditor: CocoaViewBridging {
    public typealias DefaultCocoaViewType = CocoaTextView
}
#endif

// MARK: - iOS only
#if os(iOS)
@available(iOS 16.0, *)
extension MultiDatePicker: CocoaViewBridging {
    public typealias DefaultCocoaViewType = UICalendarView
}
#endif

// MARK: - macOS only
#if os(macOS) && canImport(Cocoa)
extension Button: CocoaViewBridging {
    public typealias DefaultCocoaViewType = NSButton
}
#endif

// MARK: - Tab and Navigation
#if canImport(UIKit)
extension TabView: CocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UITabBarController
}
#elseif canImport(Cocoa)
extension TabView: CocoaViewBridging {
    public typealias DefaultCocoaViewType = NSTabView
}
#endif

#if canImport(UIKit) && os(iOS)
extension NavigationView: CocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UISplitViewController
}
#elseif canImport(Cocoa)
extension NavigationView: CocoaViewBridging {
    public typealias DefaultCocoaViewType = NSSplitView
}
#elseif canImport(UIKit) && os(tvOS)
extension NavigationView: CocoaViewControllerBridging {
    public typealias DefaultCocoaViewType = UINavigationController
}
#endif

#if canImport(UIKit)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationStack: CocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UINavigationController
}
#elseif canImport(Cocoa)
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension NavigationStack: CocoaViewBridging {
//    public typealias DefaultCocoaType = CocoaView
//}
#endif

#if os(iOS) || os(macOS)
#if canImport(UIKit)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationSplitView: CocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = UISplitViewController
}
#elseif canImport(Cocoa)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationSplitView: CocoaViewBridging {
    public typealias DefaultCocoaViewType = NSSplitView
}
#endif
#endif
