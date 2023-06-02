//
//  RestError.swift
//  Rest
//
//  Created by Brianna Zamora on 5/27/23.
//

import Foundation

public enum RestError: LocalizedError, Equatable {
    case badUrl
    case badResponseType
    case serverError(statusCode: Int, response: Data?)
}
