//
//  Badge.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-28.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct Badge: View {

    let rotationCount: Int = 8
    
    var badgeSymbols: some View {
        GeometryReader { geometry in
            ForEach(0..<self.rotationCount) { rot in
                RotatedBadgeSymbol(angle: .init(degrees: 360 / Double(self.rotationCount) * Double(rot)))
                    .opacity(0.5)
                    .scaleEffect(0.25, anchor: .top)
                    .position(.init(x: geometry.size.width / 2, y: 0.75 * geometry.size.height))
            }
        }
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            self.badgeSymbols
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
