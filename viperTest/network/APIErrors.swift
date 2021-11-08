//
//  APIErrors.swift
//  NetworkLayerRx
//
//  Created by A on 6/14/19.
//  Copyright © 2019 A. All rights reserved.
//

import Foundation

enum APIErrors: Error{
    case forbidden  // code 403
    case notfount   // code 404
    case conflict   // code 409
    case internalServerError    // code 500
    case EmptyArray
    case noConnection
    case EncryptionError
}
