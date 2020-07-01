//
//  ProfileViewModel.swift
//  TestApp
//
//  Created by Vadim on 01.07.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation
import Combine

protocol ProfileViewModelInput {
    func loadInfo()
}

protocol ProfileViewModelOutput {
    var username: Published<String> { get }
}

final class ProfileViewModel: ObservableObject {
    @Published var username = "username"
    @Published var imageData: Data?
    
    private let profileInfoProvider: ProfileInfoProvider
    
    init(profileInfoProvider: ProfileInfoProvider) {
        self.profileInfoProvider = profileInfoProvider
    }
    
    func loadInfo() {
        profileInfoProvider.prepareUsername { [weak self] username in
            self?.username = username
        }
        
        profileInfoProvider.prepareImageData(onReady: { [weak self] imageData in
            self?.imageData = imageData
        })
    }
}
