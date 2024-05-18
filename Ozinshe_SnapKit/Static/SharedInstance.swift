//
//  SharedInstance.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 04.05.2024.
//

import Foundation
import UIKit

class Storage {
    public static let sharedInstance = Storage()
    
    private let defaults = UserDefaults.standard

    var accessToken: String? {
        get {
            defaults.string(forKey: "token")
        }
        set {
            defaults.setValue(newValue, forKey: "token")
        }
    }
}
