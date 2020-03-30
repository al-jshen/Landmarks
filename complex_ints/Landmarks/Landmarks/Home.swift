//
//  Home.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-29.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData, by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Featured(items: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                        .listRowInsets(EdgeInsets())
                }
                .listRowInsets(EdgeInsets())
            
                NavigationLink(destination: LandmarkList()) {
                    Text("see all")
                }
                
            }
            .navigationBarTitle("Featured")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("showing profile")
            }
        }
        
    }
}

struct Featured: View {
    var items: [Landmark]
    var body: some View {
        items[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
