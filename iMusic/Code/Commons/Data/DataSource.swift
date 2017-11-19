//
//  DataSource.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

typealias FailureCompletionBlock = (_ error: Error) -> Void

protocol DataSource {
    func executeRequest<T: Mappable>(url: String, success: @escaping (_ object: T) -> Void, failure: @escaping FailureCompletionBlock)
}

extension DataSource {
    func executeRequest<T: Mappable>(url: String, success: @escaping (_ object: T) -> Void, failure: @escaping FailureCompletionBlock) {
        Alamofire.request(url).responseObject { (response: DataResponse<T>) in
            switch response.result {
            case .success(let value):
                success(value)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
}
