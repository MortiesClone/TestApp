//
//  ProfileView.swift
//  TestApp
//
//  Created by Vadim on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel(profileInfoProvider: ProfileInfoProviderImpl())
    
    var body: some View {
        VStack(spacing: 15) {
            if let imageData = viewModel.imageData, let image = UIImage(data: imageData) {
                Image(uiImage: image).frame(width: 100, height: 100, alignment: .center)
            } else {
                ZStack {
                    Circle().frame(width: 100, height: 100, alignment: .center)
                    Text("No image")
                        .foregroundColor(Color.white)
                }
            }
                
            Text(viewModel.username)
                .font(.title)
        }.onAppear {
            viewModel.loadInfo()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
