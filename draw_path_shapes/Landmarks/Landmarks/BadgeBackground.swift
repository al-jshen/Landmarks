//
//  Badge.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-28.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct BadgeBackground: View {
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.8
                let xOffset: CGFloat = (width * (1 - xScale)) / 2
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: xOffset + 0.95 * width,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: xOffset + $0.useWidth.0 * $0.xFactors.0 * width,
                            y: $0.useHeight.0 * $0.yFactors.0 * height
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + $0.useWidth.1 * $0.xFactors.1 * width,
                            y: $0.useHeight.1 * $0.yFactors.1 * height
                        ),
                        control: .init(
                            x: xOffset + $0.useWidth.2 * $0.xFactors.2 * width,
                            y: $0.useHeight.2 * $0.yFactors.2 * height
                        )
                    )
                    
                }
            }
            .fill(
                LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0, y: 0),
                    endPoint: .init(x: 1, y: 1)
                )
            )
            .aspectRatio(contentMode: .fit)
        }
        
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
