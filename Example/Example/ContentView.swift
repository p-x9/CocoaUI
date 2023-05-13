//
//  ContentView.swift
//  Example
//
//  Created by p-x9 on 2023/04/01.
//  
//

import SwiftUI
import CocoaUI

extension Text: CocoaViewControllerBridging {
    public typealias DefaultCocoaControllerType = CocoaViewController
}

struct ContentView: View {
    @State var value: Float = 0
    @State var toggle: Bool = true
    @State var isScrolled = false

    @State var text = "Hello"
    @State var stepperValue = 8

    var body: some View {
        TabView {
            NavigationView {
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
                            NavigationLink {
                                Text("data \(i)")
                                    .cocoa { vc in
                                        print(vc)
                                    }
                                    .onViewWillAppear { vc in
                                        vc?.tabBarController?.tabBar.isHidden = true
                                    }
                                    .onViewWillDisappear { vc in
                                        vc?.tabBarController?.tabBar.isHidden = false
                                    }
                            } label: {
                                Text("data \(i)")
                            }
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

                    TextField("textField", text: $text)
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

                    Toggle(toggle ? "on" : "off", isOn: $toggle)
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

                    Stepper("stepper", value: $stepperValue)
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
#if canImport(UIKit)
                        button.layer.borderWidth = 1
#elseif canImport(Cocoa)
                        button.wantsLayer = true
                        button.layer?.borderWidth = 8
#endif
                    }

                }
                .padding()
            }
            .cocoa { split in
                print(split)
            }
            .tabItem {
                VStack {
                    Image(systemName: "swift")
                    Text("Swift")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
