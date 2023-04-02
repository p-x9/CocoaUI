import SwiftUI

extension ScrollView: CocoaBridging {
    public typealias DefaultCocoaType = CocoaScrollView
}

extension List: CocoaBridging {
    #if canImport(UIKit)
    /// NOTE: Definition for iOS 16 or later
    /// < iOS16 `UITableView`
    public typealias DefaultCocoaType = UICollectionView
    #elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSTableView
    #endif
}

extension TextField: CocoaBridging {
    public typealias DefaultCocoaType = CocoaTextField
}

extension Toggle: CocoaBridging {
    /// NOTE: Depending on the `ToggleStyle`, Cocoa types are different.
    #if canImport(UIKit)
    public typealias DefaultCocoaType = UISwitch
    #elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSButton
    #endif
}

extension Slider: CocoaBridging {
    public typealias DefaultCocoaType = CocoaSlider
}

extension Stepper: CocoaBridging {
    public typealias DefaultCocoaType = CocoaStepper
}

extension Picker: CocoaBridging {
#if canImport(UIKit)
    public typealias DefaultCocoaType = UIPickerView
#elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSButton
#endif
}

extension DatePicker: CocoaBridging {
    public typealias DefaultCocoaType = CocoaDatePicker
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension TextEditor: CocoaBridging {
    public typealias DefaultCocoaType = CocoaTextView
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension ColorPicker: CocoaBridging {
    public typealias DefaultCocoaType = CocoaColorWell
}
