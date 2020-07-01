//
//  AuthService.swift
//  TestApp
//
//  Created by rab on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation

protocol AuthService {
    var isTokenExpired: Bool { get }
    
    func authorize(onSuccess: @escaping () -> Void)
}
