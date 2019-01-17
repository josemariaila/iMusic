//
//  DataSource.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

// MARK: - Definition

protocol APIClient {
    func execute<T: APIRequest>(request: T, completion: @escaping ResultCallback<T.Response>)
}

// MARK: - DataSource

extension APIClient {
    func execute<T: APIRequest>(request: T, completion: @escaping ResultCallback<T.Response>) {
        guard let url = endpoint(for: request) else { return }

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode(T.Response.self, from: data)
                    completion(.success(apiResponse))

                } catch {
                    completion(.failure(error))
                }

            } else if let error = error {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    private func endpoint<T: APIRequest>(for request: T) -> URL? {

        let api = API(strategy: DiscogsAPI())
        guard let baseURL = api.baseURL,
            let url = URL(string: request.resourceName, relativeTo: baseURL) else {
            fatalError("Bad resourceName: \(request.resourceName)")
        }

        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
        }

        let commonQueryItems = [URLQueryItem(name: "token", value: api.apiKey)]
        let customQueryItems: [URLQueryItem]

        do {
            customQueryItems = try URLQueryItemEncoder.encode(request)
        } catch {
            fatalError("Wrong parameters: \(error)")
        }

        components.queryItems = commonQueryItems + customQueryItems

        guard let componentsURL = components.url else {
            return nil
        }

        return componentsURL
    }
}
