//
//  NetworkError.swift
//  Fetch2
//
//  Created by Consultant on 7/11/22.
//

import Foundation

enum NetworkError: Error {
    case badData
    case badURL
    case other(Error)
}
