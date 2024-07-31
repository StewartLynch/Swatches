//
//----------------------------------------------
// Original project: Swatches
// by  Stewart Lynch on 2024-07-29
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct ColorMixerView: View {
    @State private var color1 = Color.red
    @State private var color2 = Color.blue
    @State private var fraction = 0.5
    var mixedColor: Color {
        color1.mix(with: color2, by: fraction)
    }
    var body: some View {
        NavigationStack {
            VStack {
                Slider(value: $fraction) {
                    Text("Fraction")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("1")
                }

                HStack(alignment: .bottom) {
                    VStack {
                        ColorPicker("Color 1", selection: $color1, supportsOpacity: false)
                            .labelsHidden()
                        color1
                            .frame(width: 100, height: 100)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay {
                                Text((1-fraction), format: .number.precision(.fractionLength(0...2)))
                            }
                        Text(color1.colorStrings)
                            .font(.system(size: 10))
                            .multilineTextAlignment(.center)
                    }
                    VStack {
                        mixedColor
                            .frame(width: 100, height: 100)
                            .clipShape(.rect(cornerRadius: 10))
                        Text(mixedColor.colorStrings)
                            .font(.system(size: 10))
                            .multilineTextAlignment(.center)
                    }
                    VStack {
                        ColorPicker("Color 2", selection: $color2, supportsOpacity: false)
                            .labelsHidden()
                        color2
                            .frame(width: 100, height: 100)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay {
                                Text(fraction, format: .number.precision(.fractionLength(0...2)))
                            }
                        Text(color2.colorStrings)
                            .font(.system(size: 10))
                            .multilineTextAlignment(.center)
                    }
                }
                ShaderView(mixedColor: mixedColor)
                Spacer()
            }
            .padding()
            .navigationTitle("Color Mixer")
        }
    }
}

#Preview {
    ColorMixerView()
}
