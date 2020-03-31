//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-30.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
    var profile: Profile
    
    var goalFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }
    
    var body: some View {
        List {
            
            Text(profile.username)
                .font(.title)
                .bold()
            
            Text("Notifications: \(profile.prefersNotifications ? "On" : "Off" )")
            
            Text(profile.seasonalPhoto.rawValue)
            
            Text("Goal date: \(profile.goalDate, formatter: goalFormat)")
            
            VStack(alignment: .leading) {
                
                Text("Badges")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day").hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Testing").hueRotation(Angle(degrees: 180))
                        HikeBadge(name: "Lorem Ipsum").hueRotation(Angle(degrees: 45))
                    }
                }
                .edgesIgnoringSafeArea(.trailing)
            }
            
            VStack(alignment: .leading) {
                Text("Recent Hike")
                    .font(.headline)
                
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
