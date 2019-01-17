//
//  APIError.swift
//  iMusic
//
//  Created by José María Ila on 15/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import Foundation

typealias FailureCompletionBlock = (Error) -> Void

enum APIError: Error {
    case encoding
    case decoding
    case server(message: String)
}
