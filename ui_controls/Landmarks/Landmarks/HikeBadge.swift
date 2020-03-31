//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-30.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    var body: some View {
        VStack {
            Badge()
                .frame(width: 300, height: 300, alignment: .center)
                .scaleEffect(0.4)
                .frame(width: 125, height: 125, alignment: .center)
            
            Text(name)
                .font(.caption)
            
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "testing")
    }
}
