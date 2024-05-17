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

    public var accessToken = ""
    public var userEmail = ""
}
