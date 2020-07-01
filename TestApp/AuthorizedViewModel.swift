//
//  AuthorizedViewModel.swift
//  TestApp
//
//  Created by rab on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation
import Combine

final class AuthorizedViewModel: ObservableObject {
    @Published var needToLogin: Bool = true
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func authorize() {
        authService.authorize(onSuccess: { [weak self] in
            self?.needToLogin = false
        })
    }
}
