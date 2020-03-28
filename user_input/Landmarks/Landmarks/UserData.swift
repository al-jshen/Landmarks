//
//  UserData.swift
//  Landmarks
//
//  Created by Jeff Shen on 2020-03-28.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
