//
// ----------------------------------------------
// Original project: PlatformColorAndColorExtension
// https://github.com/StewartLynch/PlatformColorAndColorExtensions
// by  Stewart Lynch on 2024-06-13
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
// ----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import SwiftUI

extension Color {
    // Initialize SwiftUI Color from hex string
    init?(hex: String) {
        guard let platformColor = PlatformColor(hex: hex) else {
            return nil
        }
        self.init(platformColor: platformColor)
    }

    // Initialize SwiftUI Color from PlatformColor
    init(platformColor: PlatformColor) {
        #if os(macOS)
        self.init(nsColor: platformColor)
        #else
        self.init(uiColor: platformColor)
        #endif
    }

    // Convert SwiftUI Color to hex string
    func toHexString(includeAlpha: Bool = false) -> String? {
        #if os(macOS)
        return NSColor(self).toHexString(includeAlpha: includeAlpha)
        #else
        return UIColor(self).toHexString(includeAlpha: includeAlpha)
        #endif
    }
    
    func toRGBString(includeAlpha: Bool = false) -> String? {
#if os(macOS)
        return NSColor(self).toRGBString(includeAlpha: includeAlpha)
#else
        return UIColor(self).toRGBString(includeAlpha: includeAlpha)
#endif
    }
    
    var colorStrings: String {
"""
\(self.toHexString() ?? "")
\(self.toRGBString() ?? "")
"""
    }

}
