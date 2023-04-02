//
//  ContentView.swift
//  Example
//
//  Created by p-x9 on 2023/04/01.
//  
//

import SwiftUI
import CocoaUI

struct ContentView: View {
    @State var value: Float = 0
    @State var toggle: Bool = true
    @State var isScrolled = false

    var body: some View {
        VStack(spacing: 4) {
            Slider(value: $value)
                .cocoa { slider in
#if canImport(UIKit)
                    slider.setThumbImage(.init(systemName: "swift"), for: .normal)
#elseif canImport(Cocoa)
                    slider.wantsLayer = true
                    slider.layer?.borderWidth = 1
#endif
                }

            List {
                ForEach(0..<100) { i in
                    Text("data \(i)")
                }
            }.cocoa { collectionView in
#if canImport(UIKit)
                collectionView.layer.borderWidth = 1
                if !isScrolled {
                    collectionView.scrollToItem(at: [0, 80], at: .bottom, animated: true)
                    isScrolled = true
                }
#elseif canImport(Cocoa)
                collectionView.wantsLayer = true
                collectionView.layer?.borderWidth = 1
#endif
            }

            TextField("textField", text: .constant("Hello"))
                .cocoa { textField in
#if canImport(UIKit)
                    textField.borderStyle = .roundedRect
                    textField.clearButtonMode = .always
                    textField.layer.borderWidth = 1
#elseif canImport(Cocoa)
                    textField.wantsLayer = true
                    textField.layer?.borderWidth = 1
                    textField.bezelStyle = .squareBezel
                    textField.isBezeled = true
#endif
                }
                .padding(.vertical)

            TextField("textField", text: .constant("Hello6"))
                .cocoa { textField in
#if canImport(UIKit)
                    textField.borderStyle = .line
                    textField.clearButtonMode = .always
                    textField.layer.borderWidth = 5
                    textField.layer.borderColor = UIColor.cyan.cgColor
#endif
                }
                .padding(.vertical)

            Toggle("Hello", isOn: $toggle)
                .cocoa { `switch` in
#if canImport(UIKit)
                    `switch`.onTintColor = .red
                    `switch`.tintColor = .red
                    `switch`.layer.borderWidth = 1
#elseif canImport(Cocoa)
                    `switch`.wantsLayer = true
                    `switch`.layer?.borderWidth = 5
#endif
                }

            Stepper("stepper", value: .constant(8))
                .cocoa { stepper in
#if canImport(UIKit)
                    stepper.stepValue = 2
                    stepper.maximumValue = 10
#elseif canImport(Cocoa)
                    stepper.maxValue = 5
#endif
                }

            ColorPicker("colorPicker", selection: .constant(.red))
                .cocoa { colorWell in
#if canImport(UIKit)
                    colorWell.supportsAlpha = false
#elseif canImport(Cocoa)
                    colorWell.alphaValue = 0.5
#endif
                }

            DatePicker("date picker", selection: .constant(Date()))
                .cocoa { datePicker in
#if canImport(UIKit)
                    datePicker.tintColor = .red
#elseif canImport(Cocoa)
                    datePicker.textColor = .red
                    datePicker.wantsLayer = true
                    datePicker.layer?.borderWidth = 8
#endif
                }

            Picker("Pick", selection: .constant("A")) {
                Text("A")
                Text("B")
            }
            .cocoa { button in
//                button.layer.borderWidth = 1
//                button.wantsLayer = true
//                button.layer?.borderWidth = 8
            }

            Button("hack") {
                print("hack")
            }
            .cocoa { button in
                button.layer.borderWidth = 1
//                button.wantsLayer = true
//                button.layer?.borderWidth = 8
            }

        }
        .padding()
        .buttonStyle(.plain)
        .toggleStyle(ButtonToggleStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Button: CocoaBridging {
    /// NOTE: Depending on the `ToggleStyle`, Cocoa types are different.
#if canImport(UIKit)
    public typealias DefaultCocoaType = UIPickerView
#elseif canImport(Cocoa)
    public typealias DefaultCocoaType = NSButton
#endif
}
