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

struct ColorView: View {
    let mixedColor: Color
    let index: Int
    let totalIterations: Int
    @Binding var colorStrings: String
    @Binding var selectedIndex: Int?
    enum Position {
        case left, center, right
    }
    var position: Position {
        let middle = totalIterations / 2
        if index < middle {
            return .left
        } else if index == middle {
            return .center
        } else {
            return .right
        }
    }
    
    var fractionValue: Double {
        let denominator = Double(totalIterations) / 2 + 0.5
        return 1.0 / denominator
    }
    
    var fraction: Double {
        if position == .left {
            return 1.0 - (Double(index) + 1) * fractionValue
        } else {
            return 1.0 - Double(totalIterations - index) * fractionValue
        }
    }
    var adjustedColor: Color {
        if position == .center {
            mixedColor
        } else {
            mixedColor.mix(with: position == .left ? .white : .black, by: fraction)
        }
    }
    var body: some View {
        adjustedColor
            .onTapGesture {
                colorStrings = adjustedColor.colorStrings
                selectedIndex = index
            }
    }
}

#Preview {
    @Previewable @State var colorStrings = ""
    @Previewable @State var selectedIndex: Int?
    ColorView(
        mixedColor: Color.teal,
        index: 0,
        totalIterations: 5,
        colorStrings: $colorStrings,
        selectedIndex: $selectedIndex
    )
    .frame(width: 100, height: 100)
}
