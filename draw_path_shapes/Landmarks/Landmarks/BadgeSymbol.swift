//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-28.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
    
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let middle = width / 2
                let spacing = width * 0.03
                let topwidth = width * 0.2
                let topheight = height * 0.45
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topwidth, y: topheight - spacing),
                    CGPoint(x: middle, y: topheight / 2 + spacing),
                    CGPoint(x: middle + topwidth, y: topheight - spacing),
                ])
                
                path.addLines([
                    CGPoint(x: middle, y: topheight / 2 + spacing * 3),
                    CGPoint(x: middle - topwidth, y: topheight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topwidth, y: topheight + spacing),
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
