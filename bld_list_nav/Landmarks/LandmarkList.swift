//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-27.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarkData) {landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPad Pro (12.9-inch) (4th generation)", "iPhone 11 Pro Max"], id: \.self) { DeviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: DeviceName))
                .previewDisplayName(DeviceName)
        }
    }
}
