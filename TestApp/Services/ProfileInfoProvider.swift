//
//  ProfileInfoProvider.swift
//  TestApp
//
//  Created by rab on 30.06.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileInfoProvider {
    func prepareImageData(onReady: @escaping (Data?) -> Void)
    func prepareUsername(onReady: @escaping (String) -> Void)
}
