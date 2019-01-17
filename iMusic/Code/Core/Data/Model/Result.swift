//
//  Result.swift
//  iMusic
//
//  Created by José María Ila on 15/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public typealias ResultCallback<Value> = (Result<Value>) -> Void
