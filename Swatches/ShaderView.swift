//
//----------------------------------------------
// Original project: Swatches
// by  Stewart Lynch on 2024-07-30
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

struct ShaderView: View {
    let mixedColor: Color
    @State private var totalIterations = 3.0
    @State private var colorStrings = ""
    @State private var selectedIndex: Int?
    var body: some View {
        VStack {
            Slider(
                value: $totalIterations,
                in: 3...11,
                step: 2) {
                    Text("Iterations")
                } minimumValueLabel: {
                    Image(systemName: "3.circle.fill")
                } maximumValueLabel: {
                    Image(systemName: "11.circle.fill")
                }
            Image(systemName: "\(Int(totalIterations)).circle.fill")
        }
        .foregroundStyle(mixedColor)
        .imageScale(.large)
        HStack {
            ForEach(0..<Int(totalIterations), id: \.self) { index in
                ColorView(
                    mixedColor: mixedColor,
                    index: index,
                    totalIterations: Int(
                        totalIterations
                    ),
                    colorStrings: $colorStrings,
                    selectedIndex: $selectedIndex
                )
                .border(selectedIndex == index ? .gray : .clear, width: 4)
            }
        }
        .frame(height: 100)
        Text(colorStrings)
            .font(.title)
            .multilineTextAlignment(.center)
            .onChange(of: totalIterations) {
                selectedIndex = nil
                colorStrings = ""
            }
            .onChange(of: mixedColor) {
                selectedIndex = nil
                colorStrings = ""
            }
    }
}

#Preview {
    ShaderView(mixedColor: Color.cyan)
}
