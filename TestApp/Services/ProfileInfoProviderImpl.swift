//
//  ProfileInfoProviderImpl.swift
//  TestApp
//
//  Created by rab on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation
import UIKit

final class ProfileInfoProviderImpl: ProfileInfoProvider {
    func prepareImageData(onReady: @escaping (Data?) -> Void) {
        guard let avatarsDict = OAuthSwiftKeeper.default.lastOAuthParameters?["avatar"] as? [String: Any],
              let thumb = avatarsDict["thumb"] as? Data else {
            return
        }
        
        onReady(thumb)
    }
    
    func prepareUsername(onReady: @escaping (String) -> Void) {
        guard let username = OAuthSwiftKeeper.default.lastOAuthParameters?["user_name"] as? String else {
            return
        }
        
        onReady(username)
    }
}
