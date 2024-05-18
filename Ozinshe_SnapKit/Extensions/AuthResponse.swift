//
//  AuthResponse.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 18.05.2024.
//

import Foundation

struct AuthResponse: Decodable {
    let token: String?
    let message: String?
}
