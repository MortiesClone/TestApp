//
//  InfoPlist.swift
//  TestApp
//
//  Created by Vadim on 01.07.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation

final class InfoPlist {
    static let `default` = InfoPlist(infoDictionary: Bundle.main.infoDictionary!)
    
    private let infoDictionary: [String: Any]

    init(infoDictionary: [String: Any]) {
        self.infoDictionary = infoDictionary
    }
    
    func getParamOrFail(named: String) -> String {
       guard let value = infoDictionary[named] as? String else {
           fatalError("Parameter doesnt exists")
       }
       return value
   }
}
