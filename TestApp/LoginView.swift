//
//  ContentView.swift
//  TestApp
//
//  Created by Vadim on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import SwiftUI

struct LoginView: View {

    private let didPressLogin: () -> Void
    
    init(didPressLogin: @escaping () -> Void) {
        self.didPressLogin = didPressLogin
    }
    
    var body: some View {
        Button(action: {
            self.didPressLogin()
        }, label: {
            Text("Login")
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(didPressLogin: {})
    }
}
