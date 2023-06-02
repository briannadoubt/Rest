//
//  URLSessionProtocol.swift
//  Rest
//
//  Created by Brianna Zamora on 5/27/23.
//

import Foundation

public protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
