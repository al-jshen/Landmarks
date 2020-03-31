//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-30.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @State var draftProfile = Profile.default
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack(alignment: .leading){
            if self.mode?.wrappedValue == .active {
                Button("Cancel") {
                    self.draftProfile = self.userData.profile
                    self.mode?.animation().wrappedValue = .inactive
                }
            }
            HStack {
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear(perform: { self.draftProfile = self.userData.profile })
                    .onDisappear(perform: { self.userData.profile = self.draftProfile })
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
