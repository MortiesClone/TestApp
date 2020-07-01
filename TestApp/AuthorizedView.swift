//
//  AuthorizedView.swift
//  TestApp
//
//  Created by rab on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import SwiftUI
import Combine

struct AuthorizedView<V: View>: View {
    
    let view: V
    
    @ObservedObject private var viewModel = AuthorizedViewModel(authService: AuthServiceImpl())
    
    init(_ view: V) {
        self.view = view
    }
    
    @ViewBuilder
    var body: some View {
        if viewModel.needToLogin {
            LoginView(didPressLogin: { viewModel.authorize() })
        } else {
            view
        }
    }
}

struct AuthorizedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizedView(Text("empty"))
    }
}
