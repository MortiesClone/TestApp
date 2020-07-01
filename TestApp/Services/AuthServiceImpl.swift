//
//  AuthServiceImpl.swift
//  TestApp
//
//  Created by rab on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation

final class AuthServiceImpl: AuthService {
    
    var isTokenExpired: Bool {
        OAuthSwiftKeeper.default.oauthSwift.client.credential.isTokenExpired()
    }
    
    func authorize(onSuccess: @escaping () -> Void) {
        let _ = OAuthSwiftKeeper.default.oauthSwift.authorize(
            withCallbackURL: InfoPlist.default.getParamOrFail(named: "AUTH_CALLBACK"),
            scope: "read", state: "123xyz", parameters: ["grant_type": "code"]) { result in
            switch result {
            case .success(_, _, let parameters):
                OAuthSwiftKeeper.default.lastOAuthParameters = parameters
                onSuccess()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
