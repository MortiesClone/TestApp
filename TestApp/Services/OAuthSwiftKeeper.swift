//
//  OAuthSwift.swift
//  TestApp
//
//  Created by rab on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation
import OAuthSwift

final class OAuthSwiftKeeper {
    
    let oauthSwift: OAuth2Swift
    var lastOAuthParameters: [String: Any]?
    
    static let `default` = OAuthSwiftKeeper()
    
    init() {
        oauthSwift = OAuth2Swift(
            consumerKey:    InfoPlist.default.getParamOrFail(named: "CONSUMER_KEY"),
            consumerSecret: InfoPlist.default.getParamOrFail(named: "CONSUMER_SECRET"),
            authorizeUrl:   InfoPlist.default.getParamOrFail(named: "AUTHORIZE_URL"),
            accessTokenUrl: InfoPlist.default.getParamOrFail(named: "ACCESS_TOKEN_URL"),
            responseType:   InfoPlist.default.getParamOrFail(named: "RESPONSE_TYPE")
        )
    }
}
