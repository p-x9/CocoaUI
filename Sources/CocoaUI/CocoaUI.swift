import SwiftUI

extension ScrollView: CocoaViewBridging {
    public typealias DefaultCocoaType = CocoaScrollView
}

extension List: CocoaViewBridging {
    #if canImport(UIKit)
    /// NOTE: Definition for iOS 16 or later
    /// < iOS16 `UITableView`
    public typealias DefaultCocoaType = UICollectionView
    #elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSTableView
    #endif
}

extension TextField: CocoaViewBridging {
    public typealias DefaultCocoaType = CocoaTextField
}

extension Toggle: CocoaViewBridging {
    /// NOTE: Depending on the `ToggleStyle`, Cocoa types are different.
    #if canImport(UIKit)
    public typealias DefaultCocoaType = UISwitch
    #elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSButton
    #endif
}

extension Slider: CocoaViewBridging {
    public typealias DefaultCocoaType = CocoaSlider
}

extension Stepper: CocoaViewBridging {
    public typealias DefaultCocoaType = CocoaStepper
}

extension Picker: CocoaViewBridging {
#if canImport(UIKit)
    public typealias DefaultCocoaType = UIPickerView
#elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSButton
#endif
}

extension DatePicker: CocoaViewBridging {
    public typealias DefaultCocoaType = CocoaDatePicker
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension TextEditor: CocoaViewBridging {
    public typealias DefaultCocoaType = CocoaTextView
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension ColorPicker: CocoaViewBridging {
    public typealias DefaultCocoaType = CocoaColorWell
}

extension Button: CocoaViewBridging {
#if canImport(UIKit)
    public typealias DefaultCocoaType = UIPickerView
#elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSButton
#endif
}

#if canImport(UIKit)
extension NavigationView: CocoaViewControllerBridging {
    public typealias DefaultCocoaType = UISplitViewController
}
#elseif canImport(Cocoa)
extension NavigationView: CocoaViewBridging {
    public typealias DefaultCocoaType = NSSplitView
}
#endif

#if canImport(UIKit)
extension TabView: CocoaViewControllerBridging {
    public typealias DefaultCocoaType = UITabBarController
}
#elseif canImport(Cocoa)
extension TabView: CocoaViewBridging {
    public typealias DefaultCocoaType = NSTabView
}
#endif

#if canImport(UIKit)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationStack: CocoaViewControllerBridging {
    public typealias DefaultCocoaType = UINavigationController
}
#elseif canImport(Cocoa)
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension NavigationStack: CocoaViewBridging {
//    public typealias DefaultCocoaType = CocoaView
//}
#endif

#if canImport(UIKit)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationSplitView: CocoaViewControllerBridging {
    public typealias DefaultCocoaType = UISplitViewController
}
#elseif canImport(Cocoa)
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension NavigationSplitView: CocoaViewBridging {
    public typealias DefaultCocoaType = NSSplitView
}
#endif
