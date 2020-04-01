//
//  NavigationMaster.swift
//  MacLandmarks
//
//  Created by Jeff Shen on 2020-03-31.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct NavigationMaster: View {
    @State private var filter: FilterType = .all
    @Binding var selectedLandmark: Landmark?
    
    var body: some View {
        VStack {
            Filter(filter: $filter)
                .controlSize(.small)
                .padding([.top, .leading], 8)
                .padding(.trailing, 4)
            
            LandmarkList(
                selectedLandmark: $selectedLandmark,
                filter: $filter
            )
            .listStyle(SidebarListStyle())
        }
        .frame(minWidth: 225, maxWidth: 300)
    }
}

struct NavigationMaster_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMaster(selectedLandmark: .constant(landmarkData[0]))
        .environmentObject(UserData())
    }
}
